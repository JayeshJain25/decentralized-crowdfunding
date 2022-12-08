const { assert, expect } = require("chai")
const { network, deployments, ethers, getNamedAccounts } = require("hardhat")
const { developmentChains } = require("../../helper-hardhat-config")

!developmentChains.includes(network.name)
    ? describe.skip
    : describe("Crowfunding", function () {
          let crowdfunding, deployer

          beforeEach(async function () {
              deployer = (await getNamedAccounts()).deployer
              await deployments.fixture("all")
              crowdfunding = await ethers.getContract("Crowdfunding", deployer)
          })

          describe("Add Gigs", function () {
              it("create new gig", async function () {
                  await crowdfunding.addGig("test", "test", 1200)
                  assert.equal(1, await crowdfunding.getGigsCount())
              })
          })
      })
