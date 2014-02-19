Package.describe({
    summary: "ng-like {{#repeat things }} block helper {{/repeat}}"
});

Package.on_use(function (api) {
    api.use(['standard-app-packages', 'coffeescript', 'underscore'], 'client');
    
    api.add_files(['repeat.html', 'repeat.litcoffee'], 'client');

});

