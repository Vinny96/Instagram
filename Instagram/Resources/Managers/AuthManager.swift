//
//  AuthManager.swift
//  Instagram
//
//  Created by Vinojen Gengatharan on 2022-03-09.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager
{
    // variables
    static let sharedAuthManager = FirebaseAuth.Auth.auth()
    private var isSignedIn : Bool = {
        return sharedAuthManager.currentUser != nil // if this returns nil and the user is signedIn it could be because the Auth object has not finished initialized yet. Something to keep an eye out for
    }()
    
    // Initializer
    private init()
    {
        // initializer code goes here
    }
    
    // MARK: - Functions
    
    internal func signIn(email : String , password : String, completion : @escaping(Result<Bool,AuthError>) -> Void) // this method will be used for signing in users not registering
    {
        // first thing we have to do is make usre the email and password are not empty as we do not want to make a call to the server unnecessarily
        if(!email.isEmpty && !password.isEmpty)
        {
            // here the email and the passwords are not empty so we can attempt a signin with the user
            AuthenticationManager.sharedAuthManager.signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(.failure(AuthError.signInError))
                    return
                }
                // here this means a success so we want to take the user to the main screen 
                completion(.success(true))
            }
            
        }
        
    }
    
    
    
    internal func signOut(completion : @escaping(Result<Bool,AuthError>) -> Void)
    {
        do
        {
            try AuthenticationManager.sharedAuthManager.signOut()
            completion(.success(true))
        }
        catch
        {
            // here we are not able to sign out the user
            completion(.failure(AuthError.signOutError))
        }
    }
    
    
    
}
