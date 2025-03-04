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


Resource    ${CURDIR}/../../keywords/api_commons_keywords.robot
Resource    ${CURDIR}/../../keywords/commons_keywords.robot


Variables    ${CURDIR}/../../testdata/${env}/setting.yaml
Variables    ${CURDIR}/../../testdata/${env}/api_detail.yaml
Variables    ${CURDIR}/../../testdata/${env}/order_detail.yaml
Variables    ${CURDIR}/../../testdata/${env}/register.yaml
Variables    ${CURDIR}/../../testdata/${env}/users.yaml
Variables    ${CURDIR}/../../testdata/${env}/products.yaml

*** Variables ***
${env}      dev