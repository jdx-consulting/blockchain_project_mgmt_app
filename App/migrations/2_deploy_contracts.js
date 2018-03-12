var ProjectDate = artifacts.require("ProjectDate");
var Project = artifacts.require("Project");
var ProjectManager = artifacts.require("ProjectManager");

module.exports = function(deployer) {
	deployer.deploy(ProjectDate);
	deployer.deploy(Project);
	deployer.deploy(ProjectManager);
};
