*** Settings ***
Resource    ${CURDIR}/../keywords/features/heal_check_api.robot
Resource    ${CURDIR}/../keywords/features/register_api.robot
Resource    ${CURDIR}/../keywords/features/order_product_api.robot
Resource    ${CURDIR}/../keywords/features/get_order_api.robot
#Should import keyword for each testcase file. Do not combile all in one file because each testcase must use only one keywords file


Resource    ${CURDIR}/../keywords/commons/api_commons.robot
Resource    ${CURDIR}/../keywords/commons/commons.robot
#For common keywords file should move to import.robot file
