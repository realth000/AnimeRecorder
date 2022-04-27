#include "json_unit.h"
#include <QtCore/QJsonDocument>

// test
#include <QtCore/QFile>
#include <QtCore/QFileInfo>

AniJson::JsonUnit::JsonUnit()
{

    // test


}

QJsonObject AniJson::JsonUnit::getJsonObject(const QString &s)
{
    QJsonParseError err;
    QJsonObject obj = QJsonDocument::fromJson(s.toUtf8().data(), &err).object();
    if (obj.isEmpty()) {
        qDebug() << err.errorString();
    }
    return obj;
}

AniJson::JsonList  AniJson::JsonUnit::readJsonFile(const QString &filePath)
{
    QFileInfo fInfo(filePath);
    if (!fInfo.exists() || !fInfo.isFile()) {
        qDebug() << "Can not read json: " << filePath;
        return AniJson::JsonList{};
    }
    QFile f(filePath);
    if (!f.open(QIODevice::ReadOnly)) {
        qDebug() << "Can not open file:" << filePath;
        return AniJson::JsonList{};
    }
    QJsonParseError err;
    AniJson::JsonList  ret;
    const QByteArray allJson = f.readAll();
    f.close();
    QJsonDocument doc = QJsonDocument::fromJson(allJson.data(), &err);
    if (doc.isNull()) {
        qDebug() << "Failed to parse json:" << err.errorString();
        return AniJson::JsonList{};
    }
    QJsonObject o = doc.object();

    // Define Json objects.
    Json j;
    QString name;
    int episodeCount = -1;
    QString description = "";
    Info info;
    State state;

    WatchState watchState;
    DownloadState downloadState;
    QList<EpisodeState> allEpisodeState;

    // Parse Json.
    name = o.value("name").toString();
    episodeCount = o.value("episode_count").toInt();
    description = o.value("description").toString();

    const QJsonObject objInfo = o.value("info").toObject();
    const QJsonObject objState = o.value("state").toObject();
    const QJsonObject objWatchState = objState.value("watch_state").toObject();
    const QJsonObject objDownloadState = objState.value("download_state").toObject();
    const QJsonObject objEpisodeState = objState.value("episode_state").toObject();

    // Make Json obj
    info.nameChs = objInfo.value("name_chs").toString();
    info.nameCht = objInfo.value("name_cht").toString();
    info.nameJp = objInfo.value("name_jp").toString();
    info.nameRm = objInfo.value("name_rm").toString();
    info.season = objInfo.value("season").toInt();
    info.episodeCount = objInfo.value("episode_count").toInt();
    info.type = objInfo.value("type").toString();
    info.storyType = objInfo.value("story_type").toString();
    info.year = objInfo.value("year").toInt();
    info.month = objInfo.value("month").toInt();

    watchState.watchEpisodeCount = objWatchState.value("watch_episode_count").toInt();
    watchState.watchEpisodes = objWatchState.value("watch_episodes").toString();

    downloadState.downloadEpisodeCount = objDownloadState.value("download_episode_count").toInt();
    downloadState.downloadSource = objDownloadState.value("download_source").toString();
    downloadState.downloadPath = objDownloadState.value("download_path").toString();
    downloadState.downloadOped = objDownloadState.value("download_oped").toBool();
    downloadState.downloadCd = objDownloadState.value("download_cd").toBool();

    QStringList allEpisode = objEpisodeState.keys();
    for (const auto &a: allEpisode) {
        QJsonObject o = objEpisodeState.value(a).toObject();
        EpisodeState e;
        e.episode = o.value("episode").toInt();
        e.watched = o.value("watched").toBool();
        e.watchTime = o.value("watch_time").toString();
        e.watchSource = o.value("watch_source").toString();
        e.download = o.value("download").toBool();
        allEpisodeState.append(e);
    }
    state.watchState = watchState;
    state.downloadState = downloadState;
    state.episodeStates = allEpisodeState;

    j.name = name;
    j.episodeCount = episodeCount;
    j.description = description;
    j.info = info;
    j.state = state;

    return ret;
}
