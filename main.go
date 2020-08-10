package main

import (
	"log"

	"github.com/gin-gonic/gin"
	_ "github.com/pilu/fresh"
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

	r.Run(":80")
}
