#ifndef JSONUNIT_H
#define JSONUNIT_H

#include <QtCore/QString>
#include <QtCore/QList>
#include <QtCore/QJsonObject>
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
QT_BEGIN_NAMESPACE
namespace AniJson {
struct Info;
struct WatchState;
struct DownloadState;
struct EpisodeState;
struct State;
struct Json;
typedef QList<Json> JsonList;
class JsonUnit;
};

QT_END_NAMESPACE

struct AniJson::Info {
    QString nameChs;
    QString nameCht;
    QString nameJp;
    QString nameRm;
    int season;
    int episodeCount;
    QString type;
    QString storyType;
    int year;
    int month;
};

struct AniJson::WatchState {
    int watchEpisodeCount;
    QString watchEpisodes;
};

struct AniJson::DownloadState {
    int downloadEpisodeCount;
    QString downloadSource;
    QString downloadPath;
    bool downloadOped;
    bool downloadCd;
};

struct AniJson::EpisodeState {
    int episode;
    bool watched;
    QString watchTime;
    QString watchSource;
    bool download;
};

struct AniJson::State {
    WatchState watchState;
    DownloadState downloadState;
    QList<EpisodeState> episodeStates;
};

struct AniJson::Json {
    QString name;
    int episodeCount;
    QString description;
    Info info;
    State state;
};

class AniJson::JsonUnit
{
public:
    JsonUnit();
    static QJsonObject getJsonObject(const QString &s);
    AniJson::JsonList readJsonFile(const QString &filePath);
};

#endif // JSONUNIT_H
