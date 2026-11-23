package main

import (
	"log"
	"net/http"
	"os"

	"task_master_backend/config"
	"task_master_backend/controllers"

	"github.com/gin-gonic/gin"
)

func main() {
	// Initialize database connection and migrations
	config.ConnectDB()

	r := gin.Default()

	// CORS middleware for Flutter web/desktop/mobile
	r.Use(func(c *gin.Context) {
		c.Writer.Header().Set("Access-Control-Allow-Origin", "*")
		c.Writer.Header().Set("Access-Control-Allow-Credentials", "true")
		c.Writer.Header().Set("Access-Control-Allow-Headers", "Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, accept, origin, Cache-Control, X-Requested-With")
		c.Writer.Header().Set("Access-Control-Allow-Methods", "POST, OPTIONS, GET, PUT, DELETE")

		if c.Request.Method == "OPTIONS" {
			c.AbortWithStatus(http.StatusNoContent)
			return
		}

		c.Next()
	})

	// Health check
	r.GET("/health", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"status":  "healthy",
			"message": "Task Master Go Backend is running",
		})
	})

	// API v1 routes
	api := r.Group("/api/v1")
	{
		tasks := api.Group("/tasks")
		{
			tasks.GET("", controllers.GetTasks)
			tasks.GET("/:id", controllers.GetTaskByID)
			tasks.POST("", controllers.CreateTask)
			tasks.PUT("/:id", controllers.UpdateTask)
			tasks.DELETE("/:id", controllers.DeleteTask)
		}
	}

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	log.Printf("Server listening on port %s...", port)
	if err := r.Run(":" + port); err != nil {
		log.Fatalf("Server failed to run: %v", err)
	}
}

