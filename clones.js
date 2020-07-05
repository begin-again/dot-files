/**
 * Clones repositories
 *
 * @module clones
 */
const exec = require('util').promisify(require('child_process').exec);
const { join } = require('path');
const GHE = 'https://github.ecu.edu/NTDG';
const defaults = {
    log: null
    , remote: GHE
    , branch: 'master'
};

/**
 * clone all the repos
 * @param {Array} names -strings of repo names
 * @param {String} destPath - location to write clone to
 * @param {Object} [options]
 *  - {Object} options.[log] - logger
 *  - {String} options.[branch] -  branch name
 *  - {String} options.[remote] -  must be https
 *
 * @returns {Promise}
 */
const cloneAll = (names, destPath, options) => {
    const _options = { ...defaults, ...options };
    return Promise.all(
        names.map(name => {
            const cmd = formatCommand(name, _options);
            return clone(cmd, name, destPath, _options);
        })
    );
};

/**
 * clone a repository
 * runs in new shell where working directory is a temp folder
 *
 * @param {String} cmd -  clone command
 * @param {String} name - repository name
 * @param {String} destPath - destination path
 * @returns {Promise} Object
 * @private
 */
const clone = (cmd, name, destPath, { log }) => {
    if(log) {
        log.debug(`clone: ${name} => ${cmd}`);
    }
    return exec(cmd, { cwd: destPath, encoding: 'utf-8' })
        .then(
            () => ({ repo: name, path: join(destPath, name) }),
            err => ({ repo: name, err: err })
        );
};

/**
 * creates the clone command
 * utilizes ssh transport
 *
 * @param {String} name - repository name
 * @param {String} remote - ssh transport
 * @param {String} branch - git branch
 * @returns {String}
 * @private
 */
const formatCommand = (name, { remote, branch }) =>
    `git clone -q -c core.longpaths=true --depth 1 --branch ${branch} ${remote}/${name}`;


module.exports = {
    cloneAll
};
