import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // Serve files from /Public folder
    app.middleware.use(
        FileMiddleware(
            publicDirectory: app.directory.publicDirectory
        )
    )
    
    app.middleware.use(ExtendPathMiddleware())

    // register routes
    let routers: [RouteCollection] = [
        WebRouter(),
        BlogRouter()
    ]
    
    for router in routers {
        try router.boot(routes: app.routes)
    }
}
