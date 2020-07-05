module.exports = {
    parser: "espree",
    extends: "eslint:recommended",
     env: {           
        "node": true,  
        "es2020": true 
    },  
    rules: {
        "brace-style": ["error", "stroustrup"],
        "indent": ["error", 4, { "MemberExpression": 1 , "ArrayExpression": 1, "ObjectExpression": 1 }],
        "no-tabs": "error",
        "quotes": ["error", "single", {"allowTemplateLiterals": true}],
        "semi": ["error", "always", {"omitLastInOneLineBlock": true }],
        "space-before-blocks": ["error", "always"],
        "space-in-parens": ["error", "never"]
    }               
}
