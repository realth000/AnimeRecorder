#ifndef JSONUNIT_H
#define JSONUNIT_H

/*
{
    name: "Animation name",
    episode_count: "Total episodes count",
    description: "some description",
    info: {
        name_chs: "Name in Chinese(simpified)",
        name_cht: "Name in Chinese(traditional)",
        name_jp: "Name in Japanese",
        name_rm: "Name in romaji",
        season: "the first / second /...",
        episode_count: "Total episodes count",
        type: "TV Anime / Film / OVA / OAD / SP",
        story_type: "type of story",
        year: "Which year on air first time",
        month: "Which month on air first time"
    },
    state: {
        watch_state: {
            watch_episode_count: "Total watched episodes count",
            watch_episodes: "Which episode watched"
        }
        download_state: {
            download_episode_count: "How many episodes downloaded",
            download_source: "Download source: WebRip / BD / Baha / B-Global",
            download_paths: "All download paths"
            download_oped: "NCOP and NCED downloaded or not"
            download_cd: "CD track downloaded or not"
        }

        episode_state: {
            "0": {
                watched: "Watched or not"
                watch_time: "Watch time"
                watch_source: "WebRip / BD / Baha / B-Global"
                downloaded: "Downloaded or not"
            }
            "1": {
                ...
            }
        }
    }
}
*/


class JsonUnit
{
public:
    JsonUnit();
};

#endif // JSONUNIT_H
