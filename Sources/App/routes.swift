import Vapor
import SwiftHtml

func routes(_ app: Application) throws {
    
    app.get { req async in
        "It works!"
    }
    
    app.routes.get("hello") { req -> Response in
        let doc = Document(.html) {
            Html {
                Head {
                    Title("Hello, Head!")
                }
                Body {
                    H1("Hello, Body!")
                }
            }
        }
        let body = DocumentRenderer(
            minify: false,
            indent: 4
        )
            .render(doc)
        return Response(
            status: .ok,
            headers: [
                "Content-Type": "text/html; charset=utf-8"
            ],
            body: .init(string: body)
        )
    }
}
