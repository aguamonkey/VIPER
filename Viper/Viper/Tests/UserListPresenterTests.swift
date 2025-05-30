//
//  UserListPresenterTests.swift
//  Viper
//
//  Created by Joshua Browne on 30/05/2025.
//

import XCTest
@testable import Viper

/// Mock implementation of UserListViewProtocol for testing
class MockUserListView: UserListViewProtocol {
    var showLoadingCalled = false
    var hideLoadingCalled = false
    var showUsersCalled = false
    var showErrorCalled = false
    var showEmptyStateCalled = false
    var displayedUsers: [User] = []
    var displayedError: String?
    
    func showLoading() {
        showLoadingCalled = true
    }
    
    func hideLoading() {
        hideLoadingCalled = true
    }
    
    func showUsers(_ users: [User]) {
        showUsersCalled = true
        displayedUsers = users
    }
    
    func showError(_ message: String) {
        showErrorCalled = true
        displayedError = message
    }
    
    func showEmptyState() {
        showEmptyStateCalled = true
    }
}

/// Mock implementation of UserListInteractorProtocol for testing
class MockUserListInteractor: UserListInteractorProtocol {
    var presenter: UserListPresenterInputProtocol?
    var fetchUsersCalled = false
    
    func fetchUsers() {
        fetchUsersCalled = true
    }
}

/// Mock implementation of UserListRouterProtocol for testing
class MockUserListRouter: UserListRouterProtocol {
    var navigateToUserDetailCalled = false
    var selectedUser: User?
    
    static func createModule() -> UIViewController {
        return UIViewController()
    }
    
    func navigateToUserDetail(for user: User) {
        navigateToUserDetailCalled = true
        selectedUser = user
    }
}

/// Unit tests for UserListPresenter
class UserListPresenterTests: XCTestCase {
    
    var presenter: UserListPresenter!
    var mockView: MockUserListView!
    var mockInteractor: MockUserListInteractor!
    var mockRouter: MockUserListRouter!
    
    override func setUp() {
        super.setUp()
        
        presenter = UserListPresenter()
        mockView = MockUserListView()
        mockInteractor = MockUserListInteractor()
        mockRouter = MockUserListRouter()
        
        presenter.view = mockView
        presenter.interactor = mockInteractor
        presenter.router = mockRouter
        mockInteractor.presenter = presenter
    }
    
    override func tearDown() {
        presenter = nil
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testViewDidLoad_CallsInteractorToFetchUsers() {
        // When
        presenter.viewDidLoad()
        
        // Then
        XCTAssertTrue(mockView.showLoadingCalled)
        XCTAssertTrue(mockInteractor.fetchUsersCalled)
    }
    
    func testRefreshUsers_CallsInteractorToFetchUsers() {
        // When
        presenter.refreshUsers()
        
        // Then
        XCTAssertTrue(mockInteractor.fetchUsersCalled)
    }
    
    func testUsersFetched_WithUsers_ShowsUsers() {
        // Given
        let users = [
            User(id: 1, name: "Test User", email: "test@example.com",
                 username: "testuser", phone: nil, website: nil,
                 company: nil, address: nil)
        ]
        
        // When
        presenter.usersFetched(users)
        
        // Then
        XCTAssertTrue(mockView.hideLoadingCalled)
        XCTAssertTrue(mockView.showUsersCalled)
        XCTAssertEqual(mockView.displayedUsers, users)
        XCTAssertFalse(mockView.showEmptyStateCalled)
    }
    
    func testUsersFetched_WithEmptyArray_ShowsEmptyState() {
        // When
        presenter.usersFetched([])
        
        // Then
        XCTAssertTrue(mockView.hideLoadingCalled)
        XCTAssertTrue(mockView.showEmptyStateCalled)
        XCTAssertFalse(mockView.showUsersCalled)
    }
    
    func testUsersFetchFailed_ShowsError() {
        // Given
        let error = NetworkError.noData
        
        // When
        presenter.usersFetchFailed(with: error)
        
        // Then
        XCTAssertTrue(mockView.hideLoadingCalled)
        XCTAssertTrue(mockView.showErrorCalled)
        XCTAssertEqual(mockView.displayedError, error.localizedDescription)
    }
    
    func testDidSelectUser_NavigatesToUserDetail() {
        // Given
        let user = User(id: 1, name: "Test User", email: "test@example.com",
                       username: "testuser", phone: nil, website: nil,
                       company: nil, address: nil)
        
        // When
        presenter.didSelectUser(user)
        
        // Then
        XCTAssertTrue(mockRouter.navigateToUserDetailCalled)
        XCTAssertEqual(mockRouter.selectedUser, user)
    }
}
