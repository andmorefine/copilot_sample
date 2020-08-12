package main

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	// success
	log.Println("success")

	router := gin.Default()
	router.LoadHTMLGlob("/go/src/templates/*.tmpl")

	router.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "ok",
		})
	})
	router.GET("/health_check", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"status": "ok",
		})
	})

	router.GET("/site", func(c *gin.Context) {
		c.HTML(http.StatusOK, "site.tmpl", gin.H{
			"title":  "Main website",
			"body":   "body",
			"status": http.StatusText(http.StatusOK),
		})
	})

	router.Run(":80")
}
