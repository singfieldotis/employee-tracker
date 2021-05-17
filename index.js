const mysql = require('mysql2');
const inquirer = require('inquirer')
require('console.table');


const connection = mysql.createConnection({
  host: 'localhost',
  port: 3001,
  user: 'root',
  password: 'Tampaoaks813',
  database: 'employees'
});

const promptMessages = {
  viewAllEmployees: "View All Employees",
  viewByDepartment: "View All Employees By Department",
  viewByManager: "View All Employees By Manager",
  addEmployee: "Add An Employee",
  removeEmployee: "Remove An Employee",
  updateRole: "Update Employee's Role",
  updateEmployeeManager: "Update Employee's Manager",
  viewAllRoles: "View All The Roles",
  exit: "Exit"
};

connection.connect(err => {
  if (err) throw err;
  prompt();
});

function prompt() {
  inquirer
    .prompt({
      name: 'action',
      type: 'list',
      message: 'What would you like to view?',
      choices: [
        promptMessages.viewAllEmployees,
        promptMessages.viewByDepartment,
        promptMessages.viewByManager,
        promptMessages.viewAllRoles,
        promptMessages.addEmployee,
        promptMessages.removeEmployee,
        promptMessages.updateRole,
        promptMessages.updateEmployeeManager,
        promptMessages.exit
      ]
    }).then(answer => {
      console.log('answer', answer);
      switch (answer.action) {
        case promptMessages.viewAllEmployees:
          viewAllEmployees();
          break;

        case promptMessages.viewByDepartment:
          viewByDepartment();
          break;

        case promptMessages.viewByManager:
          viewByManager();
          break
        
        case promptMessages.viewAllRoles:
          viewAllRoles();
          break

        case promptMessages.addEmployee:
          addEmployee();
          break

        case promptMessages.removeEmployee:
          remove('delete');

        case promptMessages.updateRole:
          remove('role');

        case promptMessages.exit:
          connection.end();
          break
      }
    });
}