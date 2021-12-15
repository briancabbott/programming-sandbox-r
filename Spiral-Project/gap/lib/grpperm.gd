#############################################################################
##
##  This file is part of GAP, a system for computational discrete algebra.
##  This file's authors include Heiko Theißen.
##
##  Copyright of GAP belongs to its developers, whose names are too numerous
##  to list here. Please refer to the COPYRIGHT file for details.
##
##  SPDX-License-Identifier: GPL-2.0-or-later
##


#############################################################################
##
#C  IsPermGroup( <obj> )
##
##  <#GAPDoc Label="IsPermGroup">
##  <ManSection>
##  <Filt Name="IsPermGroup" Arg='obj' Type='Category'/>
##
##  <Description>
##  A permutation group is a group of permutations on a finite set
##  <M>\Omega</M> of positive integers.
##  &GAP; does <E>not</E> require the user to specify the operation domain
##  <M>\Omega</M> when a permutation group is defined.
##  <P/>
##  <Example><![CDATA[
##  gap> g:=Group((1,2,3,4),(1,2));
##  Group([ (1,2,3,4), (1,2) ])
##  ]]></Example>
##  <P/>
##  Permutation groups are groups and therefore all operations for groups
##  (see Chapter&nbsp;<Ref Chap="Groups"/>) can be applied to them.
##  In many cases special methods are installed for permutation groups
##  that make computations more effective.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareSynonym( "IsPermGroup", IsGroup and IsPermCollection );


#############################################################################
##
#M  IsSubsetLocallyFiniteGroup( <G> ) . . . . . .  for magmas of permutations
##
#T  Here we assume implicitly that all permutations are finitary!
#T  (What would be a permutation with unbounded largest moved point?
#T  Perhaps a permutation of possibly infinite order?)
##
InstallTrueMethod( IsSubsetLocallyFiniteGroup, IsPermCollection );


#############################################################################
##
#M  CanEasilySortElements
##
InstallTrueMethod( CanEasilySortElements, IsPermGroup and IsFinite );

#############################################################################
##
#M  KnowsHowToDecompose( <G> )  . . . . . . . .  always true for perm. groups
##
InstallTrueMethod( KnowsHowToDecompose, IsPermGroup );


#############################################################################
##
#M  IsGeneratorsOfMagmaWithInverses( <permcoll> ) . . . true for perm. colls.
##
InstallTrueMethod( IsGeneratorsOfMagmaWithInverses, IsPermCollection );


#############################################################################
##
#F  MinimizeExplicitTransversal
##
##  <ManSection>
##  <Func Name="MinimizeExplicitTransversal" Arg='obj'/>
##
##  <Description>
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "MinimizeExplicitTransversal" );


#############################################################################
##
#F  AddCosetInfoStabChain
##
##  <ManSection>
##  <Func Name="AddCosetInfoStabChain" Arg='obj'/>
##
##  <Description>
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "AddCosetInfoStabChain" );


#############################################################################
##
#F  NumberCoset
#F  CosetNumber
##
##  <ManSection>
##  <Func Name="NumberCoset" Arg='obj'/>
##  <Func Name="CosetNumber" Arg='obj'/>
##
##  <Description>
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "NumberCoset" );

DeclareGlobalFunction( "CosetNumber" );


#############################################################################
##
#F  IndependentGeneratorsAbelianPPermGroup
##
##  <ManSection>
##  <Func Name="IndependentGeneratorsAbelianPPermGroup" Arg='obj'/>
##
##  <Description>
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "IndependentGeneratorsAbelianPPermGroup" );


#############################################################################
##
#F  OrbitPerms( <perms>, <pnt> )
##
##  <#GAPDoc Label="OrbitPerms">
##  <ManSection>
##  <Func Name="OrbitPerms" Arg='perms, pnt'/>
##
##  <Description>
##  returns the orbit of the positive integer <A>pnt</A>
##  under the group generated by the permutations in the list <A>perms</A>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "OrbitPerms" );


#############################################################################
##
#F  OrbitsPerms( <perms>, <D> )
##
##  <#GAPDoc Label="OrbitsPerms">
##  <ManSection>
##  <Func Name="OrbitsPerms" Arg='perms, D'/>
##
##  <Description>
##  returns the list of orbits of the positive integers in the list <A>D</A>
##  under the group generated by the permutations in the list <A>perms</A>.
##  <Example><![CDATA[
##  gap> OrbitPerms( [ (1,2,3)(4,5), (3,6) ], 1 );
##  [ 1, 2, 3, 6 ]
##  gap> OrbitsPerms( [ (1,2,3)(4,5), (3,6) ], [ 1 .. 6 ] );
##  [ [ 1, 2, 3, 6 ], [ 4, 5 ] ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "OrbitsPerms" );


#############################################################################
##
#F  SylowSubgroupPermGroup
##
##  <ManSection>
##  <Func Name="SylowSubgroupPermGroup" Arg='obj'/>
##
##  <Description>
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "SylowSubgroupPermGroup" );


#############################################################################
##
#F  SignPermGroup
##
##  <ManSection>
##  <Func Name="SignPermGroup" Arg='obj'/>
##
##  <Description>
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "SignPermGroup" );


#############################################################################
##
#F  CycleStructuresGroup
##
##  <ManSection>
##  <Func Name="CycleStructuresGroup" Arg='obj'/>
##
##  <Description>
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "CycleStructuresGroup" );


#############################################################################
##
#F  ApproximateSuborbitsStabilizerPermGroup( <G>, <pnt> )
##
##  <#GAPDoc Label="ApproximateSuborbitsStabilizerPermGroup">
##  <ManSection>
##  <Func Name="ApproximateSuborbitsStabilizerPermGroup" Arg='G, pnt'/>
##
##  <Description>
##  returns an approximation of the orbits of <C>Stabilizer( <A>G</A>, <A>pnt</A> )</C>
##  on all points of the orbit <C>Orbit( <A>G</A>, <A>pnt</A> )</C>,
##  without computing the full point stabilizer;
##  As not all Schreier generators are used,
##  the result may represent the orbits of only a subgroup of the point
##  stabilizer.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction("ApproximateSuborbitsStabilizerPermGroup");


#############################################################################
##
#A  AllBlocks( <G> )
##
##  <#GAPDoc Label="AllBlocks">
##  <ManSection>
##  <Attr Name="AllBlocks" Arg='G'/>
##
##  <Description>
##  computes a list of representatives of all block systems for a
##  permutation group <A>G</A> acting transitively on the points moved by the
##  group.
##  <Example><![CDATA[
##  gap> AllBlocks(g);
##  [ [ 1, 8 ], [ 1, 2, 3, 8 ], [ 1, 4, 5, 8 ], [ 1, 6, 7, 8 ], [ 1, 3 ], 
##    [ 1, 3, 5, 7 ], [ 1, 3, 4, 6 ], [ 1, 5 ], [ 1, 2, 5, 6 ], [ 1, 2 ], 
##    [ 1, 2, 4, 7 ], [ 1, 4 ], [ 1, 7 ], [ 1, 6 ] ]
##  ]]></Example>
##  <P/>
##  The stabilizer of a block can be computed via the action
##  <Ref Func="OnSets"/>:
##  <P/>
##  <Example><![CDATA[
##  gap> Stabilizer(g,[1,8],OnSets);
##  Group([ (1,8)(2,3)(4,5)(6,7) ])
##  ]]></Example>
##  <P/>
##  If <C>bs</C> is a partition of the action domain, given as a set of sets,
##  the stabilizer under the action <Ref Func="OnSetsDisjointSets"/> returns
##  the largest subgroup which preserves <C>bs</C> as a block system.
##  <P/>
##  <Example><![CDATA[
##  gap> g:=Group((1,2,3,4,5,6,7,8),(1,2));;
##  gap> bs:=[[1,2,3,4],[5,6,7,8]];;
##  gap> Stabilizer(g,bs,OnSetsDisjointSets);
##  Group([ (6,7), (5,6), (5,8), (2,3), (3,4)(5,7), (1,4), 
##    (1,5,4,8)(2,6,3,7) ])
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "AllBlocks", IsPermGroup );


#############################################################################
##
#F  TransitiveGroupsAvailable(<deg>)
##
##  <ManSection>
##  <Func Name="TransitiveGroupsAvailable" Arg='deg'/>
##
##  <Description>
##  To offer a clearer interface to the transitive groups library, this
##  function checks whether the transitive groups of degree <A>deg</A> are
##  available to load and will, if needed, load basic data structures for
##  this degree.
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "TransitiveGroupsAvailable" );

# dummy declarations to satisfy library references to transitive groups
# library
DeclareGlobalFunction( "NrTransitiveGroups" );
DeclareGlobalFunction( "TransitiveGroup" );
DeclareGlobalFunction( "TRANSProperties" );

#############################################################################
##
#A  TransitiveIdentification( <G> )
##
##  <#GAPDoc Label="TransitiveIdentification">
##  <ManSection>
##  <Attr Name="TransitiveIdentification" Arg='G'/>
##
##  <Description>
##  Let <A>G</A> be a permutation group, acting transitively on a set of up
##  to 30 points.
##  Then <Ref Func="TransitiveIdentification"/> will return the position of
##  this group in the transitive groups library.
##  This means, if <A>G</A> acts on <M>m</M> points and
##  <Ref Func="TransitiveIdentification"/>  returns <M>n</M>,
##  then <A>G</A> is permutation isomorphic to the group
##  <C>TransitiveGroup(m,n)</C>.
##  <P/>
##  Note: The points moved do <E>not</E> need to be [1..<A>n</A>], the group
##  <M>\langle (2,3,4),(2,3) \rangle</M> is considered to be transitive on 3
##  points. If the group has several orbits on the points moved by it the
##  result of <Ref Func="TransitiveIdentification"/> is undefined.
##  <Example><![CDATA[
##  gap> TransitiveIdentification(Group((1,2),(1,2,3)));
##  2
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "TransitiveIdentification", IsPermGroup );

#############################################################################
##
#F  PrimitiveGroupsAvailable(<deg>)
##
##  <ManSection>
##  <Func Name="PrimitiveGroupsAvailable" Arg='deg'/>
##
##  <Description>
##  To offer a clearer interface to the primitive groups library, this
##  function checks whether the primitive groups of degree <A>deg</A> are
##  available to load and will, if needed, load basic data structures for
##  this degree.
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "PrimitiveGroupsAvailable" );

#############################################################################
##
#A  PrimitiveIdentification( <G> )
##
##  <#GAPDoc Label="PrimitiveIdentification">
##  <ManSection>
##  <Attr Name="PrimitiveIdentification" Arg='G'/>
##
##  <Description>
##  For a primitive permutation group for which an <M>S_n</M>-conjugate exists in
##  the library of primitive permutation groups
##  (see&nbsp;<Ref Sect="Primitive Permutation Groups"/>),
##  this attribute returns the index position. That is <A>G</A> is
##  conjugate to
##  <C>PrimitiveGroup(NrMovedPoints(<A>G</A>),PrimitiveIdentification(<A>G</A>))</C>.
##  <P/>
##  Methods only exist if the primitive groups library is installed.
##  <P/>
##  Note: As this function uses the primitive groups library, the result is
##  only guaranteed to the same extent as this library. If it is incomplete,
##  <C>PrimitiveIdentification</C> might return an existing index number for a
##  group not in the library.
##  <Example><![CDATA[
##  gap> PrimitiveIdentification(Group((1,2),(1,2,3)));
##  2
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "PrimitiveIdentification", IsPermGroup );

#############################################################################
##
#A  ONanScottType( <G> )
##
##  <#GAPDoc Label="ONanScottType">
##  <ManSection>
##  <Attr Name="ONanScottType" Arg='G'/>
##
##  <Description>
##  returns the type of a primitive permutation group <A>G</A>,
##  according to the O'Nan-Scott classification.
##  The labelling of the different types is not consistent in the literature,
##  we use the following identifications. The two-letter code given is the
##  name of the type as used by Praeger.
##  <List>
##  <Mark>1</Mark>
##  <Item>
##   Affine. (HA)
##  </Item>
##  <Mark>2</Mark>
##  <Item>
##   Almost simple. (AS)
##  </Item>
##  <Mark>3a</Mark>
##  <Item>
##   Diagonal, Socle consists of two normal subgroups. (HS)
##  </Item>
##  <Mark>3b</Mark>
##  <Item>
##   Diagonal, Socle is minimal normal. (SD)
##  </Item>
##  <Mark>4a</Mark>
##  <Item>
##   Product action with the first factor primitive of type 3a. (HC)
##  </Item>
##  <Mark>4b</Mark>
##  <Item>
##   Product action with the first factor primitive of type 3b. (CD)
##  </Item>
##  <Mark>4c</Mark>
##  <Item>
##   Product action with the first factor primitive of type 2. (PA)
##  </Item>
##  <Mark>5</Mark>
##  <Item>
##   Twisted wreath product (TW)
##  </Item>
##  </List>
##  See <Cite Key="EickHulpke01"/> for correspondence to other labellings used
##  in the literature.
##  As it can contain letters, the type is returned as a string.
##  <P/>
##  If <A>G</A> is not a permutation group or does not act primitively on the
##  points moved by it, the result is undefined.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "ONanScottType", IsPermGroup );

#############################################################################
##
#A  SocleTypePrimitiveGroup( <G> )
##
##  <#GAPDoc Label="SocleTypePrimitiveGroup">
##  <ManSection>
##  <Attr Name="SocleTypePrimitiveGroup" Arg='G'/>
##
##  <Description>
##  returns the socle type of the primitive permutation group <A>G</A>.
##  The socle of a primitive group is the direct product of isomorphic simple
##  groups,
##  therefore the type is indicated by a record with components
##  <C>series</C>, <C>parameter</C> (both as described under
##  <Ref Attr="IsomorphismTypeInfoFiniteSimpleGroup" Label="for a group"/>),
##  and <C>width</C> for the number of direct factors.
##  <P/>
##  If <A>G</A> does not have a faithful primitive action,
##  the result is undefined.
##  <Example><![CDATA[
##  gap> g:=AlternatingGroup(5);;
##  gap> h:=DirectProduct(g,g);;
##  gap> p:=List([1,2],i->Projection(h,i));;
##  gap> ac:=Action(h,AsList(g),
##  > function(g,h) return Image(p[1],h)^-1*g*Image(p[2],h);end);;
##  gap> Size(ac);NrMovedPoints(ac);IsPrimitive(ac,[1..60]);
##  3600
##  60
##  true
##  gap> ONanScottType(ac);
##  "3a"
##  gap> SocleTypePrimitiveGroup(ac);
##  rec( 
##    name := "A(5) ~ A(1,4) = L(2,4) ~ B(1,4) = O(3,4) ~ C(1,4) = S(2,4) \
##  ~ 2A(1,4) = U(2,4) ~ A(1,5) = L(2,5) ~ B(1,5) = O(3,5) ~ C(1,5) = S(2,\
##  5) ~ 2A(1,5) = U(2,5)", parameter := 5, series := "A", width := 2 )
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "SocleTypePrimitiveGroup", IsPermGroup );

#############################################################################
##
#F  DiagonalSocleAction( <grp>,<n> )
##
##  <ManSection>
##  <Func Name="DiagonalSocleAction" Arg='grp,n'/>
##
##  <Description>
##  returns the direct product of <A>n</A> copied of <A>grp</A> in diagonal action.
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "DiagonalSocleAction" );

#############################################################################
##
#F  ReducedPermdegree( <g> )
##
##  <ManSection>
##  <Func Name="ReducedPermdegree" Arg='g'/>
##
##  <Description>
##  This functions tries to find cheaply a smaller domain on which the
##  permutation group <A>g</A> acts faithfully. It returns a monomorphism from
##  <A>g</A> onto an isomorphic group of smaller degree or <K>fail</K> if no such
##  domain is found. 
##  <P/>
##  In constrast to <C>SmallerDegreePermutationRepresentation</C> little effort
##  is spent on fincting completely different actions. The degree obtained
##  by <C>ReducedPermdegree</C> therefore in general is not that small, on the
##  other hand <C>ReducedPermdegree</C> works fast enough (and returns a
##  sufficiently well-behaved homomorphism) that it can be used within other
##  routines.
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction( "ReducedPermdegree" );

DeclareGlobalFunction("MovedPointsPerms");


#############################################################################
##
#A  OrbitsMovedPoints( <G> )
##
##  <#GAPDoc Label="OrbitsMovedPoints">
##  <ManSection>
##  <Attr Name="OrbitsMovedPoints" Arg='G'/>
##
##  <Description>
##  For a permutation group <A>G</A>, this attribute returns the orbits on the points moved 
##  as a set of sets.
##  <Example><![CDATA[
##  gap> OrbitsMovedPoints(Group((9,5),(7,3,2)));
##  [ [ 2, 3, 7 ], [ 5, 9 ] ]
##  ]]></Example>
##  <P/>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "OrbitsMovedPoints", IsPermGroup );


#############################################################################
##
#F  LogPerm( <a>, <b> )
##
##  <ManSection>
##  <Func Name="LogPerm" Arg='a,b'/>
##
##  <Description>
##  For two permutations <A>a</A> and <A>b</A> this function returns a
##  positive integer <A>e</A> such that <A>a^e=b</A>, or <K>false</A> if no such
##  element exists.
##  </Description>
##  </ManSection>
##
DeclareGlobalFunction("LogPerm");

# use for pcgs conversion
DeclareGlobalFunction("CreateIsomorphicPcGroup");
