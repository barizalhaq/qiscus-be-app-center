class AddOn < ApplicationRecord

    def how_to_install 
        return '''
        # Amantibus et tigres omnes

        ## Nemo corpore

        Lorem **markdownum puerile tollere**; impia, saxo amanti; cum summas veloces in,
        una ore sceleratus sustulit. Iuventae accipitrem descenderat certe; nexilibus
        lapis Achivam membra terrae thalamos melius Pandrosos fratres simulacraque
        aliquid fossa genetrix nocebant titulum. Suscitat tamen; illa illa falsa ramis,
        [ultimus prodesse](http://haec.net/ense-aliquis). Aliis nec inimica paterna
        Troianis riget ut en et esse nostro. Crescit obstruat contigit amens, silva ante
        dedi, levi cunarum caduca sub quoque esse deum ornate.

        Feres vidisti, quacumque simul: virga minorem, sanguineae digna aura. Adsiduis
        herbas; quoque sub et pectora quateret longos per virgo, pascua malas **an**
        timentia nostrae. Raptore suos efficient tantorum ducebas cthonius, lacrimas
        tabe, Saturnia thyrso. Atque per: e fera vero monimenta concutiensque [curat
        flores adsum](http://fibras.org/) inscriptum loqui stabantque.

        Cumulumque praeferri flentes membra; movet eam mihi opacas atque ulterius
        aether? Non vento remoliri timet temptat norat. Et erat comitem, in
        [causa](http://incopia.com/tigres.html) concita. Corpus in ad buxi iracunda, qui
        peterem quid. Vino boves, deos mutataque magis: numina optat pudici videt hanc
        medios.
        '''
    end

    def icon_url 
        'https://img.icons8.com/cotton/64/000000/market--v1.png'
    end

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
