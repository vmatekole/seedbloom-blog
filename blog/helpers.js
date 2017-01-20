var hbs = require('/usr/src/ghost/node_modules/express-hbs');

module.exports = function() {
    hbs.registerHelper('compare', function (v1, operator, v2, options) {
        switch (operator) {
            case '==':
                return (v1 == v2) ? options.fn(this) : options.inverse(this);
            case '===':
                return (v1 === v2) ? options.fn(this) : options.inverse(this);
            case '!=':
                return (v1 != v2) ? options.fn(this) : options.inverse(this);
            case '!==':
                return (v1 !== v2) ? options.fn(this) : options.inverse(this);
            case '<':
                return (v1 < v2) ? options.fn(this) : options.inverse(this);
            case '<=':
                return (v1 <= v2) ? options.fn(this) : options.inverse(this);
            case '>':
                return (v1 > v2) ? options.fn(this) : options.inverse(this);
            case '>=':
                return (v1 >= v2) ? options.fn(this) : options.inverse(this);
            case '&&':
                return (v1 && v2) ? options.fn(this) : options.inverse(this);
            case '||':
                return (v1 || v2) ? options.fn(this) : options.inverse(this);
            case 'typeof':
                return (typeof v1 == v2) ? options.fn(this) : options.inverse(this);
            default:
                return options.inverse(this);
        }
    });

    hbs.registerHelper('topic_css_class', function (tags) {
        if (tags) {
            for (tag of tags) {
                ex = new RegExp('-topic$');
                if (ex.test(tag.name)) {
                    return tag.name;
                }
            }
        }
    });

    hbs.registerHelper('topic', function (tags) {
        if (tags) {
            for (tag of tags) {
                ex = new RegExp('-topic$');
                if (ex.test(tag.name)) {
                    return tag.name.replace('-topic','');
                }
            }
        }
    });
}