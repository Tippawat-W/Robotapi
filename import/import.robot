*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary
Library    RequestsLibrary
Library    OperatingSystem
Library    String
Library    Collections
Library    DateTime
Library    JSONLibrary
Library    DebugLibrary


Resource    ${CURDIR}/import_variable.robot
Resource    ${CURDIR}/import_keywords.robot


Variables    ${CURDIR}/../settings/setting.yaml
