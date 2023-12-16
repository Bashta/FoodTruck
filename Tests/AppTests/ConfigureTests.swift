@testable import App
import XCTVapor

/**
 This test case verifies the configuration of the application.
 It creates an instance of the Application in testing mode, configures it using the `configure` function, and then performs the following assertions:
 - Checks if the FileMiddleware is registered as a middleware.
 - Checks if there are registered routes in the application.

 If any of the assertions fail, an error will be thrown.
 */
func testConfigure_ContainsFileMiddleware() async throws {
    let app = Application(.testing)
    defer { app.shutdown() }
    try await configure(app)

    // Test that the FileMiddleware is registered
    XCTAssertTrue(app.middleware.resolve().contains(where: { $0 is FileMiddleware }))

    // Test that the routes are registered
    XCTAssertTrue(app.routes.all.count > 0)
}
