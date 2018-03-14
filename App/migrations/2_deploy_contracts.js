var ProjectDate = artifacts.require("ProjectDate");
var ProjectDateProxy = artifacts.require("ProjectDateProxy");
var ProjectData = artifacts.require("ProjectData");
var Project = artifacts.require("Project");
var ProjectManager = artifacts.require("ProjectManager");
var ContractManager = artifacts.require("ContractManager");


module.exports = function(deployer) {
	deployer.deploy(ContractManager).then(function() {

		deployer.deploy(ProjectDate, "1.0.1", ContractManager.address);
		deployer.deploy(ProjectDateProxy, "1.0.1", ContractManager.address);
		deployer.deploy(ProjectData, "1.1.1", ContractManager.address);
		deployer.deploy(Project, "1.0.2", ContractManager.address);
		

	}).then(function() { })

	deployer.deploy(ProjectManager);
	

};
