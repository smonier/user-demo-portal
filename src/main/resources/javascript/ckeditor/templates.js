// const serverContext = (typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '';
// const moduleName = "demo-user-portal";
// const moduleContext = `${serverContext}/modules/${moduleName}`;

CKEDITOR.addTemplates(moduleName,
    {
        // The name of the subfolder that contains the preview images of the templates.
        imagesPath:`${moduleContext}/images/ckeditor/`,
        // Template definitions.
        templates:[
            {
                title:'Ads Teaser',
                image:'ads-teaser.png',
                description:'> HTML structure expected for Ads Teaser field',
                html:'<h3 class="pt-5"><span>We Are Industrial Company</span></h3>\n' +
                    '<p class="mb-5 w-75">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias iste ipsa excepturi nostrum sequi molestias?</p>'
            }
        ]
    });
