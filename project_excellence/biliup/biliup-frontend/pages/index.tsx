import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'
import {useEffect, useMemo} from "react";
// import 'xgplayer';
// import FlvPlayer from 'xgplayer-flv';

export default function Home() {
    // useEffect(() => {
    //     import('xgplayer').then(mod => {
    //         const Player = mod.default;
    //         console.log(document)
    //         let player = new Player({
    //             id: 'mse',
    //             // playsinline: true,
    //             url: '//sf1-cdn-tos.huoshanstatic.com/obj/media-fe/xgplayer_doc_video/mp4/xgplayer-demo-360p.mp4'
    //         });
    //     })
    // }, [])
    // useEffect(()=>{
    useMemo(() => {
        import('xgplayer')
            // @ts-ignore
            .then(() => import('xgplayer-flv'))
            // .then(() => import('xgplayer-flv.js'))
            .then((mod) => {
                const FlvPlayer = mod.default;
                let player = new FlvPlayer({
                    id: 'mse',
                    url: '/23_28_24.flv',
                    duration: 60
                    // url: '//sf1-cdn-tos.huoshanstatic.com/obj/media-fe/xgplayer_doc_video/flv/xgplayer-demo-360p.flv',
                    // poster: './poster.png',
                    // isLive: false,
                    // preloadTime: 30,
                    // minCachedTime: 5,
                    // cors: true
                })
            }).catch(reason => {
            console.log(reason)
        })
    }, [])



    return (
        <div className={styles.container}>
            <Head>
                <title>Create Next App</title>
                <meta name="description" content="Generated by create next app"/>
                <link rel="icon" href="/favicon.ico"/>
            </Head>
            <main className={styles.main}>
                <div id="mse"></div>
            </main>
        </div>
    )
}
