const { kill, resourceUsage } = require("process");
const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});
const fs = require("fs");
var parseString = require('xml2js').parseString;
const { time } = require("console");
var SELoc;
var BPloc;
var XMLCount = 0;
var fileList = [];
var data = {};
var json = {};
var objects = {};
var bpParts = {};
var req = {};
var text = "\n";
var blockPath;
async function doShit() {
    console.log(fs.existsSync("SEPath.txt"));
    if (fs.existsSync("SEPath.txt")) {
        console.log("Path found!");
        var blockPath = (fs.readFileSync("SEPath.txt"));
        doLogic(blockPath);
    } else if (!fs.existsSync("SEPath.txt")) {
        console.log("Path not found! Please enter below \n");
        readline.question('Drag space engineers folder here (right click game -> properties -> local files -> browse local files -> common -> drag and drop space engineers folder -> select app window -> hit enter) ', (result) => {
            var blockPath = result + "\\Content\\Data\\CubeBlocks";
            doLogic(blockPath);
            fs.writeFileSync("SEPath.txt", blockPath);
        });
    }
}
doShit();

function doLogic(blockPath) {
    try {
        var fileList = getFiles(blockPath);
        runThings(blockPath);
        console.log("Checking file!");
    } catch {
        console.error("Invalid Space Engineers file. Please check the location you got it from, and ensure that it is the file named SpaceEngineers within the common folder.");
        readline.close();
    }
}

function runThings(blockPath) {
    var count = 0;
    try {
        console.log("Getting files from space engineers!");
        while (count < fileList.length) {
            data[fileList[count]] = fs.readFileSync(blockPath + "\\" + fileList[count], { encoding: 'utf8' });
            parseString(data[fileList[count]], function(err, result) {
                json[fileList[count]] = result;
            });
            var objCount = json[fileList[count]].Definitions.CubeBlocks[0].Definition.length;
            count1 = 0;
            while (count1 < objCount) {
                var name = json[fileList[count]].Definitions.CubeBlocks[0].Definition[count1].Id[0].SubtypeId;
                var resourceTypeCount = json[fileList[count]].Definitions.CubeBlocks[0].Definition[count1].Components[0].Component.length;
                var counting = 0;
                var resources = {};
                while (counting < json[fileList[count]].Definitions.CubeBlocks[0].Definition[count1].Components[0].Component.length) {
                    var resourceType = json[fileList[count]].Definitions.CubeBlocks[0].Definition[count1].Components[0].Component[counting].$.Subtype;
                    var resourceCount = json[fileList[count]].Definitions.CubeBlocks[0].Definition[count1].Components[0].Component[counting].$.Count;
                    if (!resources.hasOwnProperty(resourceType)) {
                        resources[resourceType] = resourceCount;
                    } else {
                        var intResoruces = parseInt(resources[resourceType]);
                        var intResourceCount = parseInt(resourceCount);
                        var result = intResoruces + intResourceCount;
                        resources[resourceType] = result;
                    }
                    counting++;
                }
                objects[name] = resources;
                count1++;
            }
            count++;
        }
    } catch (e) { console.error(e) }
    readline.question('Drag blueprint folder you would like to calculate (run %appdata& -> SpaceEngineers -> blueprints -> local -> drag and drop selected blueprint folder -> select app window -> hit enter) ', (path) => {
        if (path.startsWith("&")) {
            path = path.substring(3, path.length - 1);
        }
        if (path.startsWith('"')) {
            path = path.substring(1, path.length - 1);
        }
        var count = 0;
        try {
            data[path] = fs.readFileSync(path + '\\bp.sbc', { encoding: 'utf8' });
        } catch {
            console.error("Invalid blueprint file. If blueprint includes quotes, please remove them as quotes currently break everything. If it should be a valid blueprint and isn't, god help you.");
        }
        try {
            console.log("Getting blueprint data!");
            parseString(data[path], function(err, result) {
                json[path] = result;
            });
            var length = json[path].Definitions.ShipBlueprints[0].ShipBlueprint[0].CubeGrids[0].CubeGrid.length;
            while (count < length) {
                var length2 = json[path].Definitions.ShipBlueprints[0].ShipBlueprint[0].CubeGrids[0].CubeGrid[count].CubeBlocks[0].MyObjectBuilder_CubeBlock.length;
                var count1 = 0;
                while (count1 < length2) {
                    var name = json[path].Definitions.ShipBlueprints[0].ShipBlueprint[0].CubeGrids[0].CubeGrid[count].CubeBlocks[0].MyObjectBuilder_CubeBlock[count1].SubtypeName[0];
                    if (bpParts.hasOwnProperty(JSON.stringify(name))) {
                        bpParts[JSON.stringify(name)] = bpParts[JSON.stringify(name)] + 1;
                    } else {
                        bpParts[JSON.stringify(name)] = 1;
                    }
                    count1++
                }
                count++;
            }
            readline.close();
            var length = (Object.keys(bpParts).length);
            var count = 0;
            var itemList = Object.keys(bpParts);
            console.log("Putting together each part in blueprint!");
            while (count < length) {
                var currentItem = itemList[count];
                var currentItemCount = bpParts[currentItem];
                var count1 = 0;
                while (count1 < currentItemCount) {
                    var numberOfMats = bpParts[currentItem];
                    var matCurrent = objects[currentItem.substring(1, currentItem.length - 1)]
                    var matIndex = Object.keys(matCurrent);
                    var counting = 0;
                    while (counting < matIndex.length) {
                        if (req.hasOwnProperty(matIndex[counting])) {
                            var material = parseInt(matCurrent[matIndex[counting]]);
                            req[matIndex[counting]] = req[matIndex[counting]] + material;
                        } else {
                            var material = parseInt(matCurrent[matIndex[counting]]);
                            req[matIndex[counting]] = material;
                        }
                        counting++;
                    }
                    count1++;
                }
                count++;
            }
            var partCount = Object.keys(bpParts);
            var resourceCount = Object.keys(req);
            var count = 0;
            while (count < partCount.length) {
                text = text + `${partCount[count]} X ${bpParts[partCount[count]]} \n`
                count++;
            }
            text = text + "------------------------------------------------ \n";
            var count = 0;
            while (count < resourceCount.length) {
                text = text + `${resourceCount[count]} X ${req[resourceCount[count]]} \n`
                count++;
            }
            fs.writeFileSync("requirements.txt", text);
            var outPutted = 0;
            console.log("Complete! See data here, file saved as requirements.txt\n");
            console.log(text);
            async function wait() {
                console.log("\nClose window, or wait and it will automatically close");
                await new Promise(r => setTimeout(r, 10000));
            }
            wait();
        } catch {}
        readline.close();
    });
}

function getFiles(path) {
    try {
        fileList = [];
        fs.readdirSync(path).forEach(file => {
            fileList.push(file);
            XMLCount++;
        });
        return (fileList);
    } catch {
        console.error("Invalid Space Engineers file. Please check the location you got it from, and ensure that it is the file named SpaceEngineers within the common folder.");
    }
}


function FatalError() {
    Error.apply(this, arguments);
    this.name = "FatalError";
}
FatalError.prototype = Object.create(Error.prototype);