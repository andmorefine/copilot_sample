package main

import (
	"log"

	_ "github.com/go-sql-driver/mysql"

	"github.com/gin-gonic/gin"
)

func main() {
	// success
	log.Println("success")

	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "ok",
		})
	})
	r.GET("/health_check", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"status": "ok",
		})
	})

	r.Run(":8080")
}
