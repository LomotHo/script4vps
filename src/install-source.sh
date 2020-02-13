OS=$(source /etc/os-release; echo $ID)
OS_VERSION=$(source /etc/os-release; echo $VERSION_ID)

# install source
case ${OS} in
ubuntu)
    case ${OS_VERSION} in
    "18.04"|"16.04")
        mv /etc/apt/sources.list /etc/apt/sources.list.ori
        cp ${SOURCE_LIST_HOME}/ubuntu${OS_VERSION}.sources.list /etc/apt/sources.list
        ;;
    *)
        echo "ubuntu"${OS_VERSION}" not support"
        ;;
    esac
    ;;
debian)
    case ${OS_VERSION} in
    "10"|"9")
        mv /etc/apt/sources.list /etc/apt/sources.list.ori
        cp ${SOURCE_LIST_HOME}/debian${OS_VERSION}.sources.list /etc/apt/sources.list
        ;;
    *)
        echo "debian"${OS_VERSION}" not support"
        ;;
    esac
    ;;
esac
