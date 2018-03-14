var ProjectDate = artifacts.require("ProjectDate");
var ProjectDateProxy = artifacts.require("ProjectDateProxy");
var Project = artifacts.require("Project");
var ProjectManager = artifacts.require("ProjectManager");
var ContractManager = artifacts.require("ContractManager");


module.exports = function(deployer) {
	deployer.deploy(ProjectDate, "1.0.1").then(function() {
		return deployer.deploy(ProjectDateProxy, ProjectDate.address);
	}).then(function() { })
	deployer.deploy(Project);
	deployer.deploy(ProjectManager);
	deployer.deploy(ContractManager);
	
};
