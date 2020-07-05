
const {deployableRepos} =  require(`../tooling/shell-tools/common/repos`);
const {basename, join} = require('path');
const {destroy, initBase} = require('../tooling/shell-tools/common/temp');
// TODO: pull from tooling when clone available in master
const {cloneAll} = require('./clones');


process
    .on('unhandledRejection', (err) => {
        process.exitCode = 1;
        console.error(err.message);
        destroy();
    })
    .on('uncaughtException', (err) => {
        process.exitCode =2;
        console.error(err.message);
        destroy();
    });


const report = (tempFolder) => {
    const pkg = join(tempFolder, 'deploy-builder', `package.json`);
    const allRepositories = require(pkg).repositories;
    const foundRepositores = deployableRepos().map(n => basename(n));
    console.log(
        allRepositories
            .sort((a,b) => a.name.localeCompare(b.name))
            .map(n=> n.name)
            .map(n => `${n} ${foundRepositores.includes(n) ? '' : 'missing'}`)
            .map((n,i) => `${(i+1).toString().padStart(2, '0')} ${n}`)
            .join('\n')
    );
};

const main = async () => {
    // clone deploy-builder
    const tempFolder = initBase();
    const results = await cloneAll(['deploy-builder'], tempFolder);
    if(results.filter(r => r.err).length) {
        process.exitCode = 3;
        throw new Error('failed to clone');
    }
    report(tempFolder);
    destroy();
};


main();
