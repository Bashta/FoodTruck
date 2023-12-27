@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    func testConfigure_ContainsFileMiddleware() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)

        // Test that the FileMiddleware is registered
        XCTAssertTrue(app.middleware.resolve().contains(where: { $0 is FileMiddleware }))

        // Test that the routes are registered
        XCTAssertTrue(app.routes.all.count > 0)
    }
}
