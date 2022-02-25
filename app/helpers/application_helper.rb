module ApplicationHelper
    def default_meta_tags
        {
            site:"kazutter",
            title:"kazutter",
            reverse: true,
            charset: "utf-8",
            description: 'description',
            keywords: 'kazutter',
            canonical: request.original_url,
            separator: '|',
            icon: [
                { href: image_url('favicon.ico') },
                { href: image_url('sora.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
            ],
            og: {
                site_name: "kazutter", 
                title: 'kazutter',
                description: 'description',
                type: 'website',
                url: request.original_url,
                image: image_url('sora.jpg'),
                locale: 'ja_JP',
            },
            
        }
    end
end
