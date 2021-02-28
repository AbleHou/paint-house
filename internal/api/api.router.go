package api

import (
	"github.com/gin-gonic/gin"
)

func appRouter() {
	router := gin.Default()
	router.POST("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})
	_ = router.Run("localhost:8080")
}


