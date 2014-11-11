<?xml version="1.0" encoding="UTF-8"?>
<!-- Règles de validation locale en plus du schéma teibook -->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:title>Contraintes spécifiques au théâtre pour l’OBVIL</sch:title>
  <sch:ns prefix="tei" uri="http://www.tei-c.org/ns/1.0" />  
  <sch:pattern>
      <sch:title>OBVIL, quelques règles pour augmenter la qualité</sch:title>
      <sch:rule context="tei:div">
         <sch:report test="not(@xml:id)">Les actes et scène doivent être identifiées</sch:report>
      </sch:rule>
      <sch:rule context="tei:anchor">
         <sch:report test="true()">Les ancres sont des restes d’export, à corriger</sch:report>
      </sch:rule>
   </sch:pattern>
</sch:schema>