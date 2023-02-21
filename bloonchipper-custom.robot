# Custom tests, with additional run parameters or conditions

Should Run test-fpsensor.bin uart
    Set Test Variable         ${TESTS_PATH}                  ${TESTS_PATH}/custom
    Run Test                  test-fpsensor.bin              uart


Should Run test-fpsensor.bin spi
    Set Test Variable         ${TESTS_PATH}                  ${TESTS_PATH}/custom
    Run Test                  test-fpsensor.bin              spi


Should Run test-debug.bin no_debugger
    Set Test Variable         ${TESTS_PATH}                  ${TESTS_PATH}/custom
    Run Test                  test-debug.bin                 no_debugger


Should Run test-debug.bin debugger
    Set Test Variable         ${TESTS_PATH}                  ${TESTS_PATH}/custom
    Run Test                  test-debug.bin                 debugger


Should Run test-system_is_locked.bin wp_on
    Set Test Variable         ${TESTS_PATH}                  ${TESTS_PATH}/custom
    Run Test                  test-system_is_locked.bin      wp_on


Should Run test-system_is_locked.bin wp_off
    Set Test Variable         ${TESTS_PATH}                  ${TESTS_PATH}/custom
    Run Test                  test-system_is_locked.bin      wp_off


Should Run test-rollback.bin region0
    Set Test Variable         ${TESTS_PATH}                  ${TESTS_PATH}/custom
    Run Test                  test-rollback.bin              region0


Should Run test-rollback.bin region1
    Set Test Variable         ${TESTS_PATH}                  ${TESTS_PATH}/custom
    Run Test                  test-rollback.bin              region1


Should Run test-rollback_entropy.bin
    Set Test Variable         ${TESTS_PATH}                  ${TESTS_PATH}/custom
    Start In RO               test-rollback_entropy.bin
    Write Line To Uart        runtest
    Wait For Line On Uart     Pass!


Should Run test-ftrapv.bin
    Set Test Variable         ${TESTS_PATH}                  ${TESTS_PATH}/custom
    Set Test Variable         ${TIMEOUT}                     10
    Run Test                  test-ftrapv.bin


Should Run test-panic_data.bin
    Set Test Variable         ${TESTS_PATH}                  ${TESTS_PATH}/custom
    Set Test Variable         ${TIMEOUT}                     10
    Run Test                  test-panic_data.bin
