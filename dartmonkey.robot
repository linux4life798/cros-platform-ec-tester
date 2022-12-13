*** Settings ***
Suite Setup                   Get Test Cases
Suite Teardown                Teardown
Test Setup                    Reset Emulation
Test Teardown                 Test Teardown
Resource                      ${RENODEKEYWORDS}

*** Variables ***
${PLATFORM}                   dartmonkey
${SCRIPT}                     ${CURDIR}/${PLATFORM}.resc
${BIN_PATH}                   ${CURDIR}/${PLATFORM}
${TESTS_PATH}                 ${BIN_PATH}/tests
@{pattern}                    test-*.bin

*** Keywords ***
Get Test Cases
    Setup
    @{tests}=                 List Files In Directory  ${TESTS_PATH}  @{pattern}
    Set Suite Variable        @{tests}


Create Machine
    [Arguments]               ${test}
    Execute Command           $bin=@${TESTS_PATH}/test-${test}.bin
    Execute Command           $elf_ro=@${TESTS_PATH}/${test}.RO.elf
    Execute Command           $elf_rw=@${TESTS_PATH}/${test}.RW.elf
    Execute Script            ${SCRIPT}
    Execute Command           logFile $ORIGIN/logs/dartmonkey-${test}.log
    Create Terminal Tester    sysbus.usart1  timeout=8


Run Test
    [Arguments]               ${test}
    Reset Emulation
    ${test}=                  Get Substring  ${test}  5  -4
    Create Machine            ${test}
    Start Emulation
    Wait For Line On Uart     Image: RW
    Wait For Line On Uart     MKBP not cleared within threshold
    Wait For Line On Uart     MKBP not cleared within threshold
    Write Line To Uart
    Wait For Prompt On Uart   >
    Write Line To Uart        runtest
    Wait For Line On Uart     Pass!


*** Test Cases ***

Should Run test-crc.bin
    Run Test                  test-crc.bin


Should Run test-compile_time_macros.bin
    Run Test                  test-compile_time_macros.bin


Should Run test-queue.bin
    Run Test                  test-queue.bin


Should Run test-fpsensor.bin
    Run Test                  test-fpsensor.bin


Should Run test-mutex.bin
    Run Test                  test-mutex.bin


Should Run test-static_if.bin
    Run Test                  test-static_if.bin


Should Run test-stdlib.bin
    Run Test                  test-stdlib.bin


Should Run test-mpu.bin
    Run Test                  test-mpu.bin


Should Run test-utils.bin
    Run Test                  test-utils.bin


Should Run test-scratchpad.bin
    Run Test                  test-scratchpad.bin


Should Run test-cortexm_fpu.bin
    Run Test                  test-cortexm_fpu.bin


Should Run test-libc_printf.bin
    Run Test                  test-libc_printf.bin


Should Run test-panic.bin
    Run Test                  test-panic.bin


Should Run test-ftrapv.bin
    Run Test                  test-ftrapv.bin


Should Run test-sha256_unrolled.bin
    Run Test                  test-sha256_unrolled.bin


Should Run test-rollback.bin
    Run Test                  test-rollback.bin


Should Run test-always_memset.bin
    Run Test                  test-always_memset.bin


Should Run test-abort.bin
    Run Test                  test-abort.bin


Should Run test-std_vector.bin
    Run Test                  test-std_vector.bin


Should Run test-rsa3.bin
    Run Test                  test-rsa3.bin


Should Run test-sha256.bin
    Run Test                  test-sha256.bin


Should Run test-panic_data.bin
    Run Test                  test-panic_data.bin


Should Run test-pingpong.bin
    Run Test                  test-pingpong.bin


Should Run test-printf.bin
    Run Test                  test-printf.bin


Should Run test-system_is_locked.bin
    Run Test                  test-system_is_locked.bin


Should Run test-utils_str.bin
    Run Test                  test-utils_str.bin


Should Run test-flash_write_protect.bin
    Run Test                  test-flash_write_protect.bin


Should Run test-timer_dos.bin
    Run Test                  test-timer_dos.bin


Should Run test-rollback_entropy.bin
    Run Test                  test-rollback_entropy.bin


Should Run test-fpsensor_hw.bin
    Run Test                  test-fpsensor_hw.bin


Should Run test-debug.bin
    Run Test                  test-debug.bin


Should Run test-cec.bin
    Run Test                  test-cec.bin


Should Run test-exception.bin
    Run Test                  test-exception.bin


Should Run test-rtc.bin
    Run Test                  test-rtc.bin


Should Run test-flash_physical.bin
    Run Test                  test-flash_physical.bin

