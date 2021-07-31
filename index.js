const fs = require("fs");
const { kill, resourceUsage } = require("process");
const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});
var parseString = require('xml2js').parseString;
var SELoc;
var BPloc;
var XMLCount = 0;
var fileList = [];
var data = {};
var json = {};
var objects = {};
var bpParts = {};
var req = {};
readline.question('Enter Space Engineers path here (right click game -> properties -> local files -> browse local files ', (path) => {
    var blockPath = path + "\\Content\\Data\\CubeBlocks";
    var fileList = getFiles(blockPath);
    var count = 0;
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
    readline.question('Enter the path to the blueprint you would like to print (run %appdata& -> SpaceEngineers -> blueprints -> local -> selected blueprint ', (path) => {
        var count = 0;
        data[path] = fs.readFileSync(path + "\\bp.sbc", { encoding: 'utf8' });
        parseString(data[path], function(err, result) {
            json[path] = result;
        });
        var length = json[path].Definitions.ShipBlueprints.length;
        while (count < length) {
            var length2 = json[path].Definitions.ShipBlueprints[0].ShipBlueprint[count].CubeGrids[0].CubeGrid[0].CubeBlocks[0].MyObjectBuilder_CubeBlock.length;
            var count1 = 0;
            while (count1 < length2) {
                var name = json[path].Definitions.ShipBlueprints[0].ShipBlueprint[count].CubeGrids[0].CubeGrid[0].CubeBlocks[0].MyObjectBuilder_CubeBlock[count1].SubtypeName[0];
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
        console.log(bpParts);
        while (count < length) {
            var currentItem = itemList[count];
            var currentItemCount = bpParts[currentItem];
            var count1 = 0;
            while (count1 < currentItemCount) {
                var numberOfMats = bpParts[currentItem];
                var matCurrent = objects[currentItem.substring(1, currentItem.length - 1)]
                console.log(matCurrent);
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
        console.log(req);
    });
});

function getFiles(path) {
    fileList = [];
    fs.readdirSync(path).forEach(file => {
        fileList.push(file);
        XMLCount++;
    });
    return (fileList);
}

function sum(obj) {
    var sum = 0;
    for (var el in obj) {
        if (obj.hasOwnProperty(el)) {
            sum += parseFloat(obj[el]);
        }
    }
    return sum;
}