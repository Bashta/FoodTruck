import Vapor
import SwiftHtml

func routes(_ app: Application) throws {
    
    app.get { req async in
        "It works!"
    }
    
    app.routes.get("hello") { req -> Response in
        let template = WebIndexTemplate(
            WebIndexContext(
                title: "Food Truck",
                message: "Welcome to Food Truck")
        )
        return req.templates.renderHtml(template)
    }
}
