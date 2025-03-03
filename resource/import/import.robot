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


Resource    ${CURDIR}/../../keywords/commons/api_commons.robot
Resource    ${CURDIR}/../../keywords/commons/commons.robot


Variables    ${CURDIR}/../../settings/setting.yaml
Variables    ${CURDIR}/../../testdata/api_detail.yaml
Variables    ${CURDIR}/../../testdata/order_detail.yaml
Variables    ${CURDIR}/../../testdata/register.yaml
Variables    ${CURDIR}/../../testdata/users.yaml
Variables    ${CURDIR}/../../testdata/products.yaml