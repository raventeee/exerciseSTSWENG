*** Settings ***
Documentation   Testing
...
...
...
Library     SeleniumLibrary
Resource    resources.robot
*** Test Cases ***
Standard_user Value Login
    Open Browser To Login Page
    Standard User
    Valid Login

locked_out_user Value Login
    Open Browser To Login Page
    Locked User
    Invalid Login

incorrect_password
    Open Browser To Login Page
    Invalid Password
    Invalid Password Login

problem_user
    Open Browser To Login Page
    Problem User
    Check Problem

sorting_A_Z
    Open Browser To Login Page
    Standard User
    Sort AZ

sorting_Z_A
    Open Browser To Login Page
    Standard User
    Sort ZA

sorting_L_H
    Open Browser To Login Page
    Standard User
    Sort LH

sorting_H_L
    Open Browser To Login Page
    Standard User
    Sort HL



