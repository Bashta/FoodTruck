import Vapor
import Fluent
import FluentSQLiteDriver

// configures your application
public func configure(_ app: Application) async throws {
    
    // Database setup
    let dbPath = app.directory.resourcesDirectory + "db.sqlite"
    app.databases.use(.sqlite(.file(dbPath)), as: .sqlite)
    
    // Serve files from /Public folder
    let fileMiddleware = FileMiddleware(publicDirectory: app.directory.publicDirectory)
    app.middleware.use(fileMiddleware)
    
    app.middleware.use(ExtendPathMiddleware())

    // Configure migrations
    let modules: [ModuleInterface] = [
        WebModule(),
        UserModule(),
        BlogModule()
    ]
    
    for module in modules {
        try module.boot(app)
    }
    
    try await app.autoMigrate().get()
}
