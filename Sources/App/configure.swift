import Vapor
import Fluent
import FluentSQLiteDriver
import Liquid
import LiquidLocalDriver

// configures your application
public func configure(_ app: Application) async throws {

    // Configure Liquid
    app.fileStorages.use(
        .local(publicUrl: "http://localhost:8080",
               publicPath: app.directory.publicDirectory,
               workDirectory: "assets"), as: .local)
    app.routes.defaultMaxBodySize = "10mb"

    // Database setup
    let dbPath = app.directory.resourcesDirectory + "db.sqlite"
    app.databases.use(.sqlite(.file(dbPath)), as: .sqlite)

    // Serve files from /Public folder
    let fileMiddleware = FileMiddleware(publicDirectory: app.directory.publicDirectory)
    app.middleware.use(fileMiddleware)

    // Configure routing
    app.middleware.use(ExtendPathMiddleware())

    // Configure sessions
    app.sessions.use(.fluent)
    app.migrations.add(SessionRecord.migration)
    app.middleware.use(app.sessions.middleware)

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
