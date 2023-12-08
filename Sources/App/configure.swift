import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // Serve files from /Public folder
    app.middleware.use(
        FileMiddleware(
            publicDirectory: app.directory.publicDirectory
        )
    )
    // register routes
    let router = WebRouter()
    try router.boot(routes: app.routes)
}
