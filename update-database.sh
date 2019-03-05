#!/bin/bash

DB_USERNAME="root"
DB_PASSWORD="password"
DATABASE="dependency_updates_db"
product=''

usingLastVersion=$(xmllint --xpath 'DependencyUpdatesReport/summary/usingLastVersion/text()' dependency-updates-report.xml)
nextVersionAvailable=$(xmllint --xpath 'DependencyUpdatesReport/summary/nextVersionAlailable/text()' dependency-updates-report.xml)
nextIncremetalAvailable=$(xmllint --xpath 'DependencyUpdatesReport/summary/nextIncremetalAvailable/text()' dependency-updates-report.xml)
nextMinorAvailable=$(xmllint --xpath 'DependencyUpdatesReport/summary/nextMinorAvailable/text()' dependency-updates-report.xml)
nextMajorAvailable=$(xmllint --xpath 'DependencyUpdatesReport/summary/nextMajorAvailable/text()' dependency-updates-report.xml)

function insertDataToDatabase {
 mysql -u${DB_USERNAME} -p${DB_PASSWORD} dependency_updates_db -e \
 "INSERT INTO DEPENDENCY_SUMMERY (product, using_lastest_versions, next_version_available,next_incremental_available,next_minor_available,next_major_available) VALUES('$product',$usingLastVersion,$nextVersionAvailable,$nextIncremetalAvailable,$nextMinorAvailable,$nextMajorAvailable) ON DUPLICATE KEY UPDATE using_lastest_versions=$usingLastVersion, next_version_available=$nextVersionAvailable, next_incremental_available=$nextIncremetalAvailable, next_minor_available=$nextMinorAvailable, next_major_available=$nextMajorAvailable;"
}
# capture named arguments
while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}' | awk -F/ '{print $NF}'`

    case ${PARAM} in
        --github-url)
            product=${VALUE}
            ;;
        *)
            echo "ERROR: unknown parameter \"${PARAM}\""
            exit 1
            ;;
    esac
    shift
done

insertDataToDatabase
