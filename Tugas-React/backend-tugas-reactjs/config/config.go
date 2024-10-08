package config

import (
	"log"
	"os"
	"strconv"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"tugas-sb-sanbercode-go-next-2024/Tugas-React/backend-tugas-reactjs/models"
)

var db *gorm.DB

func InitDB() *gorm.DB {
	// Fetch environment variables
	host := os.Getenv("DB_HOST")
	port := os.Getenv("DB_PORT")
	user := os.Getenv("DB_USER")
	dbname := os.Getenv("DB_NAME")
	password := os.Getenv("DB_PASSWORD")
	sslmode := "require"

	if os.Getenv("ENVIRONMENT") == "development" {
		sslmode = "disable"
	}
	// Construct database connection string
	dsn := "host=" + host + " port=" + port + " user=" + user + " dbname=" + dbname + " password=" + password + " sslmode=" + sslmode

	// Initialize database connection
	var err error
	db, err = gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Fatalf("Failed to connect to database: %v", err)
	}

	// Ping to make sure the database connection is alive
	err = db.Raw("SELECT 1").Error
	if err != nil {
		log.Fatalf("Database connection error: %v", err)
	}

	// Set up database connection pool settings (optional)
	maxIdleConnsStr := os.Getenv("DB_MAX_IDLE_CONNS")
	maxIdleConns := 5 // Default value if not set or invalid
	if maxIdleConnsStr != "" {
		var err error
		maxIdleConns, err = strconv.Atoi(maxIdleConnsStr)
		if err != nil {
			log.Fatalf("Invalid DB_MAX_IDLE_CONNS: %v", err)
		}
	}
	maxOpenConnsStr := os.Getenv("DB_MAX_OPEN_CONNS")
	maxOpenConns := 10 // Default value if not set or invalid
	if maxOpenConnsStr != "" {
		var err error
		maxOpenConns, err = strconv.Atoi(maxOpenConnsStr)
		if err != nil {
			log.Fatalf("Invalid DB_MAX_OPEN_CONNS: %v", err)
		}
	}

	dbSQL, err := db.DB()
	if err != nil {
		log.Fatalf("Failed to get SQL DB instance: %v", err)
	}
	dbSQL.SetMaxIdleConns(maxIdleConns)
	dbSQL.SetMaxOpenConns(maxOpenConns)

	// Clean up prepared statement cache
	db.Exec("DEALLOCATE ALL")

	// Migrate the database
	Migrate()

	return db
}

// GetDB returns the global database connection
func GetDB() *gorm.DB {
	return db
}

// Migrate performs database migrations
func Migrate() {
	err := db.AutoMigrate(
		&models.JadwalKuliah{},
		&models.Dosen{},
		&models.MataKuliah{},
		&models.Mahasiswa{},
		&models.Nilai{},
		&models.User{},
	)
	if err != nil {
		log.Fatalf("Failed to migrate database: %v", err)
	}
}
