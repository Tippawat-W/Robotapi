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


Resource    ${CURDIR}/import_variable.resource
Resource    ${CURDIR}/import_keyword.resource
Resource    ${CURDIR}/import_locator.resource
Variables    ${CURDIR}/../settings/setting.yaml
