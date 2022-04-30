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
    def contentful
        @client ||= Contentful::Client.new(
          access_token: Rails.application.credentials.contentful[:access_token],
          space: Rails.application.credentials.contentful[:space_id],
          dynamic_entries: :auto,
          raise_errors: true
        )
    end
    
end
