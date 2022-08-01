#!/bin/sh

for i in "$@"; do
  case $i in
      -l|--long)
      LONG=true
      shift # past argument with no value
      ;;
    -*|--*)
      echo "Unknown option $i"
      exit 1
      ;;
    *)
      ;;
  esac
done

SUMMARY=$(gum input --placeholder "Message")

if [[ "${LONG}" == "true" ]]; then
  DESCRIPTION=$(gum write --placeholder "Details")
fi

# Commit these changes
gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"
