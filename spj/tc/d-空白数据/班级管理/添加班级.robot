*** Settings ***
Library    pylib.SchoolClassLib

#Suite Setup         delete all school classe
#Suite Teardown       delete school class

*** Test Cases ***
添加班级1 - tc000001
    [Setup]     delete all school classes
    ${ret1}=    add school class    1     1班     60
    should be true     $ret1['retcode']==0

#列出班级，检验一下
    ${ret2}=    list school class    1
    ${fc}=   evaluate   $ret2['retlist'][0]
    should be true    $fc['id']==$ret1['id']
    should be true    $fc['invitecode']==$ret1['invitecode']

    [Teardown]    delete school class   &{ret1}[id]


添加班级2 - tc000002
    [Setup]     delete all school classes
    ${ret1}=    add school class    1     random.randint(1,999999)     65
    should be true     $ret1['retcode']==0

#列出班级，检验一下
    ${ret2}=    list school class    1
    ${fc}=   evaluate   $ret2['retlist'][0]
    should be true    $fc['id']==$ret1['id']
    should be true    $fc['invitecode']==$ret1['invitecode']

    [Teardown]    delete school class   &{ret1}[id]

添加班级3 - tc000003
    [Setup]     delete all school classes
    ${ret1}=    add school class    1     1班     60
    should be true     $ret1['retcode']==0

    ${ret2}=    list school class    1
    ${fc2}=   evaluate   $ret2['retlist'][0]

    ${ret3}=    add school class    1     1班     60
    should be true     $ret3['retcode']==1

    ${ret4}=    list school class    1
    ${fc4}=   evaluate   $ret4['retlist'][0]
    should be true    $ret2['retlist'][0]==$ret4['retlist'][0]


    [Teardown]    delete school class   &{ret1}[id]





