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

Variables    ${CURDIR}/../../testdata/${env}/test_data.yaml
Variables    ${CURDIR}/../../testdata/common/test_data.yaml
Variables    ${CURDIR}/configs/common_configs.yaml
Variables    ${CURDIR}/configs/${env}/env_config.yaml

*** Variables ***
${env}    dev