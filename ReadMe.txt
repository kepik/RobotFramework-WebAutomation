https://www.demoblaze.com/
test cases:
 1. Login and Logout
 2. Add and delete product on cart
 3. Confirm order
 4. Negative Login cases

run test:
    robot -d Reports/Login --loglevel TRACE Tests/LoginTests.robot
    robot -d Reports/Product --loglevel TRACE Tests/AddDeleteProductTests.robot
    robot -d Reports/Order --loglevel TRACE Tests/ConfirmOrderTests.robot

run specific tags:
    robot --include=positiveCases -d Reports/positiveCases Tests/LoginTests.robot
    robot --include=negativeCases -d Reports/negativeCases Tests/LoginTests.robot

run all test suites:
    robot -d Reports Tests/*.robot