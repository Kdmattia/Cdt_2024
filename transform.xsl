<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" />

    <!--HTML-->
    <xsl:template match="/">
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link rel="stylesheet" type="text/css" href="style.css"/>
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script type="text/javascript" src="script.js"></script>
                <title>Progetto esame Codifica di Testi 2024</title>
            </head>

            <body>
                <div class="header">
                    <h1>
                        <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                    </h1>
                </div>

                <h2>Seleziona elementi da evidenziare</h2>

                <div class="pulsanti">
                    <button class="yellow" id="PersoneReali">Persone Reali</button>
                    <button class="gray" id="PersoneImmaginarie">Personaggi</button>
                    <button class="gold" id="Opere">Opere</button>
                    <button class="pink" id="Luoghi">Luoghi</button>
                    <button class="purple" id="LuoghiNaturali">Luoghi Naturali</button>
                    <button class="orange" id="CasaEditriceRivista">Casa Editrice o Rivista</button>
                    <button class="light_green" id="Date">Date</button>
                    <button class="red" id="Verbum">Verbum</button>
                    <button class="dark_green" id="TemiMotivi">Temi e Motivi</button>
                    <button class="cyan" id="TestoStraniero">Lingua straniera</button>
                    <button class="blue" id="Citazioni">Citazioni</button>
                    <button class="brown" id="Organizzazioni">Organizzazioni</button>
                    <button class="normalizzazioni" id="Normalizzazioni">Normalizzazioni</button>
                    <button class="correzioni" id="Correzioni">Correzioni</button>
                </div>

                <!--Articoli-->
                <div class="container_testo">

                    <div class="container_articolo">
                        <xsl:for-each
                            select="tei:TEI/tei:text/tei:body/tei:div/tei:div[@type='article']">
                            <div class="section">
                                <h2>
                                    <xsl:value-of select="tei:head"/>
                                </h2>

                                <xsl:for-each select="tei:pb">
                                    <xsl:variable name="page_id">
                                        <xsl:value-of select="@xml:id" />
                                    </xsl:variable>

                                    <div class="page">
                                        <div class="facsimile">
                                            <xsl:apply-templates select="." />
                                        </div>
                                    
                                        <xsl:choose>
                                            <!-- Caso con due colonne -->
                                            <xsl:when test="following-sibling::tei:cb[position()=2]">
                                                <div class="table_align">
                                                    <table class="columns">
                                                        <tbody>
                                                            <tr>
                                                                <th>Colonna 1</th>
                                                                <th>Colonna 2</th>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="column-left">
                                                                        <xsl:apply-templates select="following-sibling::tei:cb[@corresp=concat('#',$page_id) and @n=1]" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="column-right">
                                                                        <xsl:apply-templates select="following-sibling::tei:cb[@corresp=concat('#',$page_id) and @n=2]" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </xsl:when>
                                    
                                            <!-- Caso con una sola colonna -->
                                            <xsl:otherwise>
                                                <div class="table_align">
                                                    <table class="columns">
                                                        <tbody>
                                                            <tr>
                                                                <th>Colonna Unica</th>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="column-single">
                                                                        <xsl:apply-templates select="following-sibling::tei:cb[@corresp=concat('#',$page_id) and @n=1]" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </xsl:for-each>
                    </div>

                </div>


                <footer>
                    <p>Informazioni sul progetto:</p>
                    <div class="container_footer">
                        <button id="bibliografia">Descrizione Bibliografica</button>
                        <button id="codifica">Informazioni sulla Codifica</button>
                        <div id="el_footer1">
                            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc"/>
                        </div>
                        <div id="el_footer2">
                            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:encodingDesc"/>
                        </div>
                    </div>
                </footer>
            </body>
        </html>
    </xsl:template>

    <!--templates-->

    <!--fileDesc-->
    <xsl:template match="tei:fileDesc">
        <h1>Descrizione bibliografica</h1>
        <ul>
            <li>
                <h3>Conversione TEI P5 relizzata da</h3>
                <ul>
                    <li>
                        <xsl:apply-templates select="tei:titleStmt/tei:respStmt"/>
                    </li>
                </ul>
            </li>

            <li>
                <h3>Data e luogo di pubblicazione</h3>
                <ul>
                    <li>
                        <xsl:apply-templates select="tei:publicationStmt"/>
                    </li>
                </ul>
                
            </li>

            <li>
                <h3>Informazioni sulla fonte</h3>
                <ul>
                    <li>
                        <xsl:apply-templates select="tei:sourceDesc"/>
                    </li>
                </ul>
            </li>

        </ul>
    </xsl:template>

    <xsl:template match="tei:titleStmt/tei:respStmt">
        <table>
            <tr>
                <xsl:for-each select="tei:name">
                    <td>
                        <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                        <xsl:value-of select="."/>
                    </td>
                </xsl:for-each>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="tei:publicationStmt">
        <table>
            <tr>
                <td><xsl:value-of select="tei:publisher"/></td>
                <td><xsl:value-of select="tei:pubPlace"/></td>
                <td><xsl:value-of select="tei:date"/></td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="tei:sourceDesc">
        <table id="articoli">
            <xsl:for-each select="tei:biblStruct/tei:analytic">
                <tr>
                    <td><xsl:value-of select="@xml:id"/></td>
                    <td><xsl:value-of select="tei:title"/></td>
                </tr>
            </xsl:for-each>
        </table>
        <xsl:apply-templates select="tei:biblStruct/tei:monogr"/>

    </xsl:template>

    <xsl:template match="tei:sourceDesc/tei:biblStruct/tei:monogr">
        <table id="monogr">
            <tr>
                <td>Fondatori de "La Rassegna Settimanale"</td>
                <xsl:for-each select="tei:respStmt/tei:name">
                    <td>
                        <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                        <xsl:value-of select="."/>
                    </td>
                </xsl:for-each>
            </tr>

            <tr>
                <td>Informazioni editore</td>
                <td><xsl:value-of select="tei:imprint/tei:publisher"/></td>
                <td><xsl:value-of select="tei:imprint/tei:pubPlace"/></td>
                <td><xsl:value-of select="tei:imprint/tei:date"/></td>
            </tr>

            <tr>
                <td>Lingua</td>
                <td><xsl:value-of select="tei:textLang"/></td>
            </tr>
            
            <tr>
                <td>Materiale selezionato</td>
                <td>Volume: <xsl:value-of select="tei:biblScope[@unit='volume']"/></td>
                <td>Fascicolo: <xsl:value-of select="tei:biblScope[@unit='issue']"/></td>
                <td>Pagine: <xsl:value-of select="tei:biblScope[@unit='page']"/></td>
            </tr>
        </table>
    </xsl:template>

    <!--encodingDesc-->
    <xsl:template match="tei:encodingDesc">
        <h1>Informazioni sulla codifica</h1>
        <ul>
            <li>
                <h3>Progetto</h3>
                <ul>
                    <li>
                        <xsl:value-of select="tei:projectDesc"/>
                    </li>
                </ul>
            </li>

            <li>
                <h3>Selezione materiale</h3>
                <ul>
                    <li>
                        <xsl:value-of select="tei:samplingDecl"/>
                    </li>
                </ul>
            </li>

            <li>
                <h3>Correzioni</h3>
                <ul>
                    <li>
                        <xsl:value-of select="tei:editorialDecl/tei:correction"/>
                    </li>
                </ul>
            </li>

            <li>
                <h3>Normalizzazioni</h3>
                <ul>
                    <li>
                        <xsl:value-of select="tei:editorialDecl/tei:normalization"/>
                    </li>
                </ul>
            </li>

            <li>
                <h3>Sillabazione</h3>
                <ul>
                    <li>
                        <xsl:value-of select="tei:editorialDecl/tei:hyphenation"/>
                    </li>
                </ul>
            </li>

        </ul>
    </xsl:template>

    <!--Surface-->
    <xsl:template match="tei:surface">
        <xsl:element name="img">
            <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute>
            <xsl:attribute name="usemap">#<xsl:value-of select="@xml:id"/></xsl:attribute>
            <xsl:attribute name="alt">Immagine_<xsl:value-of select="@xml:id"/></xsl:attribute>
            <xsl:attribute name="class">facsimile</xsl:attribute>
        </xsl:element>

        <xsl:element name="map">
            <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
            <xsl:for-each select="tei:zone">
                <xsl:element name="area">
                    <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                    <xsl:attribute name="coords"><xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/></xsl:attribute>
                    <xsl:attribute name="alt">area_<xsl:value-of select="@xml:id"/></xsl:attribute>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    <!--pb-->
    <xsl:template match="tei:pb">
        <xsl:variable name="pb_surface" select="substring-after(@facs, '#')" />
        <xsl:apply-templates select="//tei:facsimile/tei:surface[@xml:id = $pb_surface]"/>
    </xsl:template>

    <!--cb-->
    <xsl:template match="tei:cb">
        <xsl:variable name="id_cb" select="@xml:id"/>
        <xsl:apply-templates select="following-sibling::tei:ab[@corresp=concat('#', $id_cb)] |
                                    following-sibling::tei:head[@corresp=concat('#', $id_cb)] |
                                    following-sibling::tei:div[@corresp=concat('#', $id_cb)] |
                                    following-sibling::tei:lg[@corresp=concat('#', $id_cb)] |
                                    following-sibling::tei:bibl[@corresp=concat('#', $id_cb)] |
                                    following-sibling::tei:p[@corresp=concat('#', $id_cb)]">
        </xsl:apply-templates>
    </xsl:template>


    <!--head-->
    <xsl:template match="tei:head">
        <div>
            <b>
                <xsl:attribute name="id">
                    <xsl:value-of select="substring-after(@facs, '#')"/>
                </xsl:attribute>
                <xsl:value-of select="substring-after(@facs, '#')"/>
            </b>
            <div>
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>

    <!--p-->
    <xsl:template match="tei:p">
        <div>
            <b>
                <xsl:attribute name="id">
                    <xsl:value-of select="substring-after(@facs, '#')"/>
                </xsl:attribute>
                <xsl:value-of select="substring-after(@facs, '#')"/>
            </b>
            <div>
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>


    <!--ab-->
    <xsl:template match="tei:ab">
        <div>
            <b>
                <xsl:attribute name="id">
                    <xsl:value-of select="substring-after(@facs, '#')"/>
                </xsl:attribute>
                <xsl:value-of select="substring-after(@facs, '#')"/>
            </b>
            <div>
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>

    <!--lg-->
    <xsl:template match="tei:lg">
        <div>
            <b>
                <xsl:attribute name="id">
                    <xsl:value-of select="substring-after(@facs, '#')"/>
                </xsl:attribute>
                <xsl:value-of select="substring-after(@facs, '#')"/>
            </b>
            <div>
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>

    <!--lb-->
    <xsl:template match="tei:lb">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <!--l-->
    <xsl:template match="tei:l">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <!-- Opere-->
    <xsl:template match="tei:div//tei:title">
        <span class="titolo_opera">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:div//tei:bibl"/>

    <!--Persone reali e personaggi-->
    <xsl:template match="tei:div//tei:persName">
                <xsl:choose>
                    <xsl:when test="@type='fictional' or @type='fictive'">
                        <xsl:element name="span">
                            <xsl:attribute name="class">
                                personaggio
                            </xsl:attribute>
                            <xsl:attribute name="id">
                                <xsl:value-of select="@xml:id" />
                            </xsl:attribute>
                            <xsl:apply-templates/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="span">
                            <xsl:attribute name="class">
                                pers_reale
                            </xsl:attribute>
                            <xsl:attribute name="id">
                                <xsl:value-of select="@xml:id" />
                            </xsl:attribute>
                            <xsl:apply-templates/>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
                <div class="pers_info">
                    <ul>
                        <xsl:choose>
                                <xsl:when test="tei:surname and tei:forename">
                                    <li>Nome: <xsl:value-of select="tei:forename"/></li>
                                    <li>Cognome: <xsl:value-of select="tei:surname"/></li>
                                </xsl:when>
                                <xsl:when test="tei:forename">
                                    <li>Nome: <xsl:value-of select="tei:forename"/></li>
                                </xsl:when>
                                <xsl:when test="tei:surname">
                                    <li>Cognome: <xsl:value-of select="tei:surname"/></li>
                                </xsl:when>
                                <xsl:otherwise>
                                    <li>Nome completo: <xsl:apply-templates/></li>
                                </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="tei:roleName">
                                <li>Ruolo: <xsl:value-of select="tei:roleName"/></li>
                            </xsl:when>
                            <xsl:otherwise>
                                <li>Ruolo: <xsl:value-of select="@role"/></li>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="@ref">
                            <li>
                                <xsl:element name="a">
                                <xsl:attribute name="href"><xsl:value-of select="@ref"/></xsl:attribute>
                                Ulteriori informazioni (Wikipedia)
                                </xsl:element>
                            </li>
                        </xsl:if>
                    </ul>
                </div>
    </xsl:template>

<!--Ref-->
    <xsl:template match="tei:div//tei:ref">
        <xsl:variable name="target_id" select="substring-after(@target, '#')" />
        <xsl:variable name="targetNode" select="//tei:persName[@xml:id = $target_id]" />
        <xsl:variable name="targetBibl" select="//tei:bibl[@xml:id = $target_id]" />
        
        <xsl:choose>
            <xsl:when test="$targetNode">
                <xsl:choose>
                    <xsl:when test="$targetNode/@type='fictional' or $targetNode/@type='fictive'">
                        <xsl:element name="span">
                            <xsl:attribute name="class">
                                personaggio
                            </xsl:attribute>
                            <xsl:value-of select="."/>
                        </xsl:element>
                        <div class="pers_info">
                            <ul>
                                <xsl:choose>
                                        <xsl:when test="$targetNode/tei:surname and $targetNode/tei:forename">
                                            <li>Nome: <xsl:value-of select="$targetNode/tei:forename"/></li>
                                            <li>Cognome: <xsl:value-of select="$targetNode/tei:surname"/></li>
                                        </xsl:when>
                                        <xsl:when test="$targetNode/tei:forename">
                                            <li>Nome: <xsl:value-of select="$targetNode/tei:forename"/></li>
                                        </xsl:when>
                                        <xsl:when test="$targetNode/tei:surname">
                                            <li>Cognome: <xsl:value-of select="$targetNode/tei:surname"/></li>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <li>Nome completo: <xsl:apply-templates/></li>
                                        </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$targetNode/tei:roleName">
                                        <li>Ruolo: <xsl:value-of select="$targetNode/tei:roleName"/></li>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <li>Ruolo: <xsl:value-of select="$targetNode/@role"/></li>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:if test="$targetNode/@ref">
                                    <li>
                                        <xsl:element name="a">
                                        <xsl:attribute name="href"><xsl:value-of select="$targetNode/@ref"/></xsl:attribute>
                                        Ulteriori informazioni (Wikipedia)
                                        </xsl:element>
                                    </li>
                                </xsl:if>
                            </ul>
                        </div>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="span">
                            <xsl:attribute name="class">
                                pers_reale
                            </xsl:attribute>
                            <xsl:value-of select="."/>
                        </xsl:element>
                        <div class="pers_info">
                            <ul>
                                <xsl:choose>
                                        <xsl:when test="$targetNode/tei:surname and $targetNode/tei:forename">
                                            <li>Nome: <xsl:value-of select="$targetNode/tei:forename"/></li>
                                            <li>Cognome: <xsl:value-of select="$targetNode/tei:surname"/></li>
                                        </xsl:when>
                                        <xsl:when test="$targetNode/tei:forename">
                                            <li>Nome: <xsl:value-of select="$targetNode/tei:forename"/></li>
                                        </xsl:when>
                                        <xsl:when test="$targetNode/tei:surname">
                                            <li>Cognome: <xsl:value-of select="$targetNode/tei:surname"/></li>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <li>Nome completo: <xsl:apply-templates/></li>
                                        </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$targetNode/tei:roleName">
                                        <li>Ruolo: <xsl:value-of select="$targetNode/tei:roleName"/></li>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <li>Ruolo: <xsl:value-of select="$targetNode/@role"/></li>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:if test="$targetNode/@ref">
                                    <li>
                                        <xsl:element name="a">
                                        <xsl:attribute name="href"><xsl:value-of select="$targetNode/@ref"/></xsl:attribute>
                                        Ulteriori informazioni (Wikipedia)
                                        </xsl:element>
                                    </li>
                                </xsl:if>
                            </ul>
                        </div>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$targetBibl">
                <span class="titolo_opera">
                    <xsl:value-of select="."/>
                </span>
                <div class="bibliografia">
                    <xsl:attribute name="id">
                        <xsl:value-of select="$targetBibl/@xml:id" />
                    </xsl:attribute>
                    Bibliografia <xsl:apply-templates select="$targetBibl/tei:title[1]"/><br/>
                        <ul>
                            <li>Info Titolo:
                                <ul>
                                    <xsl:for-each select="$targetBibl/tei:title">
                                        <xsl:choose>
                                            <xsl:when test="@type='collection'">
                                                <li>Titolo della collezione: <xsl:apply-templates/></li>
                                            </xsl:when>
                                            <xsl:when test="@type='alternative'">
                                                <li>Titolo alternativo: <xsl:apply-templates/></li>
                                            </xsl:when>
                                            <xsl:when test="@type='main'">
                                                <li>Titolo principale: <xsl:apply-templates/></li>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <li><xsl:apply-templates/></li>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </ul>
                                </li>
                            <li>Data di pubblicazione: <xsl:apply-templates select="$targetBibl/tei:date"/></li>
                            <li>Luogo di pubblicazione: <xsl:apply-templates select="$targetBibl/tei:pubPlace"/></li>
                            <li>Autore: <xsl:apply-templates select="$targetBibl/tei:author"/></li>
                            <li>Note sull'opera: <xsl:apply-templates select="$targetBibl/tei:note"/></li>
                        </ul>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--Date-->
    <xsl:template match="tei:date">
        <xsl:element name="span">
            <xsl:attribute name="class">date</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!--Verbum-->
    <xsl:template match="tei:term[@type='verbum']">
        <xsl:element name="span">
            <xsl:attribute name="class">verbum</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!--Testo straniero-->
    <xsl:template match="tei:div//*[@xml:lang]">
        <xsl:element name="span">
            <xsl:attribute name="class">foreign</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!--Citazioni-->
    <xsl:template match="tei:quote | tei:said">
        <xsl:element name="span">
            <xsl:attribute name="class">cit</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!--Correzioni e Normalizzazioni-->
    <xsl:template match="tei:reg">
        <xsl:element name="span">
            <xsl:attribute name="class">reg</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:corr">
        <xsl:element name="span">
            <xsl:attribute name="class">corr</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:orig">
        <xsl:element name="span">
            <xsl:attribute name="class">orig</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:sic">
        <xsl:element name="span">
            <xsl:attribute name="class">sic</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!--Temi-->
    <xsl:template match="tei:term[@type='theme']">
        <xsl:element name="span">
            <xsl:attribute name="class">tema</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!--Luoghi-->
    <xsl:template match="tei:placeName">
        <xsl:choose>
            <xsl:when test="@type='natural'">
              <span class="luogo_naturale">
                <xsl:apply-templates/>
              </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="luogo">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--Organizzazioni e Casa Editrice/Rivista-->
    <xsl:template match="tei:orgName">
        <xsl:choose>
            <xsl:when test="@type='media'">
              <span class="Rivista">
                <xsl:apply-templates/>
              </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="organizzazione">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>



</xsl:stylesheet>