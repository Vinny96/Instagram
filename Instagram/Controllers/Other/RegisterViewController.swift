//
//  RegisterViewController.swift
//  Instagram
//
//  Created by Vinojen Gengatharan on 2022-03-09.
//

import Foundation
import UIKit
import SafariServices


class RegisterViewController : UIViewController
{
    //MARK: - UI
    
    private let headerView = SignInHeaderView()
    
    private let profilePictureImageView: UIImageView = {
        let imageViewToReturn = UIImageView()
        imageViewToReturn.tintColor = .label
        imageViewToReturn.image = UIImage(systemName: "person.circle")
        imageViewToReturn.contentMode = .scaleAspectFit
        imageViewToReturn.layer.masksToBounds = true
        imageViewToReturn.layer.cornerRadius = 45
        return imageViewToReturn
    }()
    
    private let userNameTextField : IGTextField = {
        let textFieldToReturn = IGTextField()
        textFieldToReturn.placeholder = "UserName....."
        textFieldToReturn.returnKeyType = .next
        textFieldToReturn.autocorrectionType = .no
        textFieldToReturn.autocapitalizationType = .none
        return textFieldToReturn
    }()
    
    
    private let emailTextField : IGTextField = {
        let textFieldToReturn  = IGTextField()
        textFieldToReturn.placeholder = "Email......"
        textFieldToReturn.returnKeyType = .next
        textFieldToReturn.autocorrectionType = .no
        textFieldToReturn.autocapitalizationType = .none
        return textFieldToReturn
    }()
    
    private let passwordTextField : UITextField = {
        let textFieldToReturn = IGTextField()
        textFieldToReturn.placeholder = "Password....."
        textFieldToReturn.isSecureTextEntry = true
        textFieldToReturn.returnKeyType = .continue
        textFieldToReturn.autocorrectionType = .no
        textFieldToReturn.autocapitalizationType = .none
        return textFieldToReturn
    }()
    
    
    private let registerButton : IGButton = {
        let buttonToReturn = IGButton()
        buttonToReturn.setTitle("Register", for: .normal)
        buttonToReturn.setTitleColor(.green, for: .normal)
        return buttonToReturn
    }()
    
    private let viewPrivacyButton : IGButton = {
        let buttonToReturn = IGButton()
        buttonToReturn.setTitle("View Privacy Notice", for: .normal)
        return buttonToReturn
    }()
    
    private let viewTermsButton : IGButton = {
        let buttonToReturn = IGButton()
        buttonToReturn.setTitle("View Terms", for: .normal)
        return buttonToReturn
    }()
    
    // variables
    private let authManagerHandler = AuthenticationManager.sharedAuthManager
    
    
    
    //MARK: - System Called Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Create Account"
        addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        createAllFrames()
        addAllActionsForButtons()
        
    }
    
    //MARK: - UI Functions
    private func createAllFrames()
    {
        //createHeaderViewFrame()
        createProfilePictureInmageViewFrame()
        createUserNameTextFieldFrame()
        createEmailTextFieldFrame()
        createPasswordTextFieldFrame()
        createRegisterButtonFrame()
        createViewPrivacyButtonFrame()
        createViewTermsButtonFrame()
    }
    
    private func addAllActionsForButtons()
    {
        viewPrivacyButton.addTarget(self, action: #selector(didTapViewPrivacyButton), for: .touchUpInside)
        viewTermsButton.addTarget(self, action: #selector(didTapViewTermsButton), for: .touchUpInside)
    }
    
    /*private func createHeaderViewFrame()
    {
        headerView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: (view.height - view.safeAreaInsets.top) / 3)
    }*/
    
    private func createProfilePictureInmageViewFrame()
    {
        profilePictureImageView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: (view.height - view.safeAreaInsets.top) / 3)
    }
    
    private func createUserNameTextFieldFrame()
    {
        userNameTextField.frame = CGRect(x: 25, y: profilePictureImageView.bottom + 20, width: view.width - 50, height: 50)
    }
    
    private func createEmailTextFieldFrame()
    {
        emailTextField.frame = CGRect(x: 25, y: userNameTextField.bottom + 20, width: view.width - 50, height: 50)
    }
    
    private func createPasswordTextFieldFrame()
    {
        passwordTextField.frame = CGRect(x: 25, y: emailTextField.bottom + 10, width: view.width - 50, height: 50)
    }
    
    private func createRegisterButtonFrame()
    {
        registerButton.frame = CGRect(x: 35, y: passwordTextField.bottom + 20, width: view.width - 70, height: 50)
    }
    
    
    private func createViewPrivacyButtonFrame()
    {
        viewPrivacyButton.frame = CGRect(x: 35, y: registerButton.bottom + 55, width: view.width - 70, height: 50)
    }
    
    private func createViewTermsButtonFrame()
    {
        viewTermsButton.frame = CGRect(x: 35, y: viewPrivacyButton.bottom + 10, width: view.width - 70, height: 50)
    }
    
    //MARK: - OBJC Methods
    @objc internal func didTapSignInButton()
    {
        signInUser()
    }
    
    @objc internal func didTapCreateAccountButton()
    {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc internal func didTapViewPrivacyButton()
    {
        // so here we will create an inApp webbrowser that will take us to the insttagram privacy policy
        guard let safeURL = URL(string: "https://help.instagram.com/519522125107875/?maybe_redirect_pol=0") else {
            return
        }
        // now we have to create the inApp webbrowswer that will take us to this URL
        let vc = SFSafariViewController(url: safeURL)
        present(vc, animated: true, completion: nil)
    }
    
    @objc internal func didTapViewTermsButton()
    {
        // so here we will create an inApp webbrowser that will take us to the instagram terms of use
        guard let safeURL = URL(string: "https://help.instagram.com/581066165581870") else {
            return
        }
        // now we have to create the inApp webbrowswer that will take us to this URL
        let vc = SFSafariViewController(url: safeURL)
        present(vc, animated: true, completion: nil)
    }
    
    //MARK: Functions
    internal func addSubviews()
    {
        //headerView.backgroundColor = .systemRed
        //view.addSubview(headerView)
        view.addSubview(profilePictureImageView)
        view.addSubview(userNameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        view.addSubview(viewPrivacyButton)
        view.addSubview(viewTermsButton)
    }
    
    private func signInUser()
    {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        // first thing we want to get is the email and the password
        guard let safeUserEmail = emailTextField.text, !safeUserEmail.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        guard let safeUserPassword = passwordTextField.text, !safeUserEmail.trimmingCharacters(in: .whitespaces).isEmpty, safeUserPassword.count >= 6 else {
            return
        }
        // call the authManager to sign in. This will be implemented later on
        
        
    }
    // stopped at 3:38
}
//MARK: - Extensions


    
    
    
    

