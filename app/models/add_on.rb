class AddOn < ApplicationRecord
    # dummy
    def images
        return [
            {
                url: 'https://i.picsum.photos/id/1/5616/3744.jpg?hmac=kKHwwU8s46oNettHKwJ24qOlIAsWN9d2TtsXDoCWWsQ',
                caption: 'image 1'
            },
            {
                url: 'https://i.picsum.photos/id/1/5616/3744.jpg?hmac=kKHwwU8s46oNettHKwJ24qOlIAsWN9d2TtsXDoCWWsQ',
                caption: 'image 1'
            }
        ]
    end
end
